//
//  ListNoteContext.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

class ListNoteContext: ListItemContext {
    let presenter: ListItemPresenter
    let tableViewSetup: ListItemTableViewSetup
    init() {
        let presenter = ListNotePresenter()
        self.tableViewSetup = ListNoteTableViewSetup(
            provider: presenter
        )
        self.presenter = presenter
    }
}
