//
//  NoteEditorController.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/21/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import RichEditorView
import Common

class NoteEditorController: UIViewController {
    private var editorView: EditorView!
    
    var navigator: NoteEditorNavigator!
    var presenter: NoteEditorPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupEditorView()
        
        view.backgroundColor = .red
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
            action: #selector(saveEditedNote)
        )
    }
    
    @objc
    private func dismissController() {
        navigator.back()
    }
    
    private var editableField: EditableField<Note>!
    private var noteViewModel: NoteViewModel!
    @objc
    private func saveEditedNote() {
        noteViewModel.content = editorView.contentHTML
        editableField.field = noteViewModel.noteEditableField!
        presenter.save(editableField: editableField)
        navigator.back()
    }
    
    private func setupEditorView() {
        switch presenter.session {
        case .new:
            editableField = EditableField<Note>(
                field: Note.EditableField(
                    title: "New Title",
                    privacy: .default,
                    content: "New Content")
            )
        case let .edit(note):
            editableField = EditableField<Note>(
                field: Note.EditableField(
                    title: note.title,
                    privacy: note.privacy,
                    content: note.content)
            )
        }
        editorView = EditorView(frame: view.bounds)
        noteViewModel = NoteViewModel(
            noteEditableField: editableField.field
        )
        editorView.html = noteViewModel.content ?? ""
        view.addSubview(editorView)
    }
}
