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
    private let delegate: UITableViewDelegate
    
    init(dataSource: ListFolderDataSource, delegate: ListFolderDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
    }
    
    func setupTableView(_ tableView: UITableView) {
        tableView.registerReusableCell(FolderCell.self)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
}

class ListFolderDataSource: ListItemDataSource {}

class ListFolderDelegate: ListItemDelegate {
    var navigator: ListItemNavigator?
    var itemSelector: ((IndexPath) -> Folder)?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let folder = itemSelector?(indexPath) else { return }
        navigator?.selectItem(ItemSelected(item: folder))
    }
}
