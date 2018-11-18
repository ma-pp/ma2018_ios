//
//  FolderEditorController.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/16/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

class FolderEditorController: UIViewController {
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var privacySelector: UISegmentedControl!
    
    var navigator: FolderEditorNavigator!
    var presenter: FolderEditorPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTextView()
        setupEditableField()
    }
    
    private func setupNavigationBar() {
        navigationController?
            .navigationBar
            .configure(with: .solid(.white))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "X",
            style: .plain,
            target: self,
            action: #selector(dismissController)
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(saveEditedFolder)
        )
    }
    
    private var editableField: EditableField<Folder>!
    
    private func setupEditableField() {
        switch presenter.session {
        case .new:
            editableField = EditableField<Folder>(
                field: Folder.EditableField(
                    title: "",
                    privacy: .default,
                    description: ""
                )
            )
        case let .edit(folder):
            editableField = EditableField<Folder>(
                field: Folder.EditableField(
                    title: folder.title,
                    privacy: folder.privacy,
                    description: folder.description
                )
            )
        }
        
        titleTextView.text = editableField.field.title
        descriptionTextView.text = editableField.field.description
        privacySelector.selectedSegmentIndex = editableField.field.privacy.rawValue
    }
    
    @objc
    private func dismissController() {
        navigator.back()
    }
    
    @objc
    private func saveEditedFolder() {
        editableField.field.privacy = Privacy(
            rawValue: privacySelector.selectedSegmentIndex
            ) ?? .default
        
        presenter.save(editableField: editableField)
        navigator.back()
    }
    
    private func setupTextView() {
        titleTextView.delegate = self
        descriptionTextView.delegate = self
    }
    
    
    private var currentFirstResponder: UIResponder?
    
    @objc
    private func doneEdit() {
        currentFirstResponder?.resignFirstResponder()
    }
}

extension FolderEditorController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        currentFirstResponder = textView
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        switch textView {
        case titleTextView:
            editableField.field.title = textView.text
        case descriptionTextView:
            editableField.field.description = textView.text
        default:
            break
        }
    }
}
