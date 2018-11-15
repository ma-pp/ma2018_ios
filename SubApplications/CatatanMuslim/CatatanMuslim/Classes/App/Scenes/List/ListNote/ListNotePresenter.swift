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
    let title: String = "Note"
    var items: [ICellConfigurator] = []
    
    init() {
        items = (1...10).map { (value) -> ICellConfigurator in
            return NoteCellConfigured(
                data: NoteCell.Data(
                    title: "Note \(value)",
                    author: "Writer \(value)",
                    privacy: .onlyMe,
                    dateUpdated: Date(),
                    isUnread: value % 2 == 0,
                    content: "WKWKW"
                )
            )
        }
    }
}
