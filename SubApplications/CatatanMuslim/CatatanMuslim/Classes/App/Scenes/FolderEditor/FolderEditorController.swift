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
    @IBOutlet weak var textView: UITextView!
    
    var session: EditorSession<Folder>!
    var navigator: FolderEditorNavigator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTextView()
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
    
    @objc
    private func dismissController() {
        navigator.back()
    }
    
    @objc
    private func saveEditedFolder() {
        navigator.back()
    }
    
    private func setupTextView() {
        textView.delegate = self
        let b = UIButton()
        b.setTitle("Done", for: .normal)
        b.addTarget(self, action: #selector(doneEdit), for: .touchUpInside)
        let textAccesoryView = InputAccesory(
            buttons: [
                b
            ]
        )
        textAccesoryView.frame.origin = .zero
        textAccesoryView.frame.size = CGSize(width: view.bounds.width, height: 44)
        textAccesoryView.backgroundColor = .red
        textView.inputAccessoryView = textAccesoryView
        
        
        textView.text = "textAccesoryView.frame.size = CGSize(width: view.bounds.width, height: 44)"
    }
    
    @objc
    private func doneEdit() {
        textView.resignFirstResponder()
    }
}

extension FolderEditorController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        textView.sizeToFit()
        self.view.layoutIfNeeded()
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }
}
