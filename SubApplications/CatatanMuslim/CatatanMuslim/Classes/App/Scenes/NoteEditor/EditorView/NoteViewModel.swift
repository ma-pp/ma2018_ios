//
//  NoteViewModel.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/21/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

struct NoteViewModel {
    // HTML representation Note in Editor
    var content: String? {
        didSet {
            self.noteEditableField = _createNoteEditableField()
        }
    }
    var noteEditableField: Note.EditableField?
    
    init(noteEditableField: Note.EditableField) {
        self.noteEditableField = noteEditableField
        self.content = _createContent()
    }
    
    private func _createContent() -> String {
        guard let field = noteEditableField else { return "" }
        let title = field.title
        let contentHTML = field.content
        let titleHTML = HTMLElement.head(level: 1, content: title)
        return titleHTML.stringRepresentation + contentHTML
    }
    
    private func _createNoteEditableField() -> Note.EditableField? {
        
        let parsed = _parse()
        
        guard let field = noteEditableField else { return nil }
        
        return Note.EditableField(
            title: parsed.title,
            privacy: field.privacy,
            content: parsed.content
        )
    }
    
    private func _parse() -> (title: String, content: String) {
        let defaultReturn = ("", "")
        guard let content = content else { return defaultReturn }
        guard let _titleContent = content.untilOccurence(of: "</h1>") else {
            return defaultReturn
        }
        guard let _content = content.afterOccurence(of: "</h1>") else {
            return defaultReturn
        }
        
        let _title = HTMLElement.content(
            from: _titleContent
        )
        
        return (_title, _content)
    }
}

extension String {
    func untilOccurence(of string: String) -> String? {
        guard let range = self.range(of: string, options: []) else {
            return nil
        }
        return String(self[..<range.upperBound])
    }
    
    func afterOccurence(of string: String) -> String? {
        guard let range = self.range(of: string, options: []) else {
            return nil
        }
        return String(self[range.upperBound...])
    }
}
