//
//  ListNoteTableViewSetup.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

import Foundation
import Common

class ListNoteTableViewSetup: ListItemTableViewSetup {
    private let dataSource: UITableViewDataSource
    
    init(provider: ConfiguratorProvider) {
        dataSource = ListNoteDataSource(
            provider: provider
        )
    }
    
    func setupTableView(_ tableView: UITableView) {
        tableView.registerReusableCell(NoteCell.self)
        tableView.dataSource = dataSource
    }
}

class ListNoteDataSource: ListItemDataSource {}

