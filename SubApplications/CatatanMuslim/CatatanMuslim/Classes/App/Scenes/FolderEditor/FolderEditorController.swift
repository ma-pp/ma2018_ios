//
//  FolderEditorController.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/16/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

class FolderEditorController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
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
