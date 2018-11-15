//
//  ListNotePresenter.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import Common

class ListNotePresenter: ListItemPresenter {
    let folder: Folder
    let title: String
    
    private(set) var notes: [Note] = []
    init(folder: Folder) {
        self.folder = folder
        self.title = folder.title
        
        notes = [
            Note(
                id: "wkwkw",
                title: "Belajar Bahasa Arab",
                author: "Muiz",
                privacy: .private,
                dateUpdated: Date(),
                isRead: true,
                content: "hahahaha"
            ),
            Note(
                id: "wkwkw2",
                title: "Belajar Bahasa Jepang",
                author: "Muiz",
                privacy: .public,
                dateUpdated: Date(),
                isRead: false,
                content: "ahahaha"
            )
        ]
    }
}

extension ListNotePresenter: ConfiguratorProvider {
    var items: [ICellConfigurator] {
        return notes.map { (note) -> ICellConfigurator in
            return NoteCellConfigured(
                data: NoteCell.Data(
                    title: "Note \(note.title)",
                    author: "Writer \(note.author)",
                    privacy: note.privacy,
                    dateUpdated: note.dateUpdated,
                    isUnread: !note.isRead,
                    content: note.content
                )
            )
        }
    }
}
