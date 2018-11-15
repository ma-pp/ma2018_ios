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
    var items: [ICellConfigurator] = []
    
    init() {
        items = (1...10).map { (value) -> ICellConfigurator in
            return FolderCellConfigured(
                data: FolderCell.Data(
                    title: "TITLE \(value)",
                    author: "AUTHOR \(value)",
                    totalNotes: value,
                    totalUnread: value,
                    privacy: .public,
                    dateUpdated: Date().addingTimeInterval(
                        Double(60 * 60 * 24 * value)
                    )
                )
            )
        }
    }
}
