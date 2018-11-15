//
//  ListFolderContext.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

class ListFolderContext: ListItemContext {
    let presenter: ListItemPresenter
    let tableViewSetup: ListItemTableViewSetup
    init() {
        let presenter = ListFolderPresenter()
        self.tableViewSetup = ListFolderTableViewSetup(
            provider: presenter
        )
        self.presenter = presenter
    }
}
