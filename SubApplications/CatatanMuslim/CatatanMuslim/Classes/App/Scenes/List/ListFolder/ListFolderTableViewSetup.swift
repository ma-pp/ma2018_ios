//
//  ListFolderTableViewSetup.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import Common

class ListFolderTableViewSetup: ListItemTableViewSetup {
    private let dataSource: UITableViewDataSource
    
    init(provider: ConfiguratorProvider) {
        dataSource = ListFolderDataSource(
            provider: provider
        )
    }
    
    func setupTableView(_ tableView: UITableView) {
        tableView.registerReusableCell(FolderCell.self)
        tableView.dataSource = dataSource
    }
}

class ListFolderDataSource: ListItemDataSource {}
