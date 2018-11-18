//
//  FolderEditorPresenter.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/17/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

class FolderEditorPresenter {
    
    let session: EditorSession<Folder>
    
    init(session: EditorSession<Folder>) {
        self.session = session
    }
    
    func save(editableField: EditableField<Folder>) {
        switch session {
        case .new:
            let newfolder = Folder.New(
                title: editableField.field.title,
                privacy: editableField.field.privacy,
                description: editableField.field.description
            )
        case let .edit(folder):
            let editedFolder = editableField.build(from: folder)
        }
    }
}

extension Folder: Editable {
    struct EditableField: EditableBuilder {
        var title: String
        var privacy: Privacy
        var description: String
        
        func build(old: Folder) -> Folder {
            return Folder(
                id: old.id,
                title: self.title,
                author: old.author,
                description: self.description,
                notesCount: old.notesCount,
                unreadCount: old.unreadCount,
                privacy: self.privacy,
                dateUpdated: old.dateUpdated
            )
        }
    }
}
