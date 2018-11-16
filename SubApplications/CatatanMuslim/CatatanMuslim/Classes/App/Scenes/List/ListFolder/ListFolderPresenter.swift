//
//  ListFolderPresenter.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import Common

class ListFolderPresenter: ListItemPresenter {
    let title: String = "Folder"
    private(set) var folders: [Folder] = []
    init() {
        folders = [
            Folder(
                id: "wkwkw",
                title: "Travel",
                author: "Muiz",
                notesCount: 2,
                unreadCount: 1,
                privacy: .private,
                dateUpdated: Date()
            ),
            Folder(
                id: "wkwkw2",
                title: "Computer",
                author: "Comunity",
                notesCount: 20,
                unreadCount: 10,
                privacy: .public,
                dateUpdated: Date()
            )
        ]
        
    }
}

extension ListFolderPresenter: ConfiguratorProvider {
    var items: [ICellConfigurator] {
        return folders.map { (folder) -> ICellConfigurator in
            return FolderCellConfigured(
                data: FolderCell.Data(
                    title: "TITLE \(folder.title)",
                    author: "AUTHOR \(folder.author)",
                    totalNotes: folder.notesCount,
                    totalUnread: folder.unreadCount,
                    privacy: .public,
                    dateUpdated: folder.dateUpdated
                )
            )
        }
    }
}
