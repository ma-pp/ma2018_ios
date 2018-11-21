//
//  NoteEditorPresenter.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/21/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

class NoteEditorPresenter {
    let session: EditorSession<Note>
    
    init(session: EditorSession<Note>) {
        self.session = session
    }
    
    func save(editableField: EditableField<Note>) {
        switch session {
        case .new:
            let newNote = Note.New(
                title: editableField.field.title,
                privacy: editableField.field.privacy,
                content: editableField.field.content
            )
        case let .edit(note):
            let editedNote = editableField.build(from: note)
        }
    }
}

extension Note: Editable {
    struct EditableField: EditableBuilder {
        var title: String
        var privacy: Privacy
        var content: String
        
        func build(old: Note) -> Note {
            return Note(
                id: old.id,
                title: title,
                author: old.author,
                privacy: privacy,
                dateUpdated: old.dateUpdated,
                isRead: old.isRead,
                content: content
            )
        }
    }
}
