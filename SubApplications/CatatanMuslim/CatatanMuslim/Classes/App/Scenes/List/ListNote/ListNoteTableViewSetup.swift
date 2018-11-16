//
//  ListNoteTableViewSetup.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import Common
import Logging

class ListNoteTableViewSetup: ListItemTableViewSetup {
    private let dataSource: UITableViewDataSource
    private let delegate: UITableViewDelegate
    
    init(dataSource: ListNoteDataSource, delegate: ListNoteDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
    }
    
    func setupTableView(_ tableView: UITableView) {
        tableView.registerReusableCell(NoteCell.self)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
    
    deinit {
        CustomLogging.deallocate(self)
    }
}

class ListNoteDataSource: ListItemDataSource {
    deinit {
        CustomLogging.deallocate(self)
    }
}

class ListNoteDelegate: ListItemDelegate {
    var navigator: ListItemNavigator?
    var itemSelector: ((IndexPath) -> Note)?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let note = itemSelector?(indexPath) else { return }
        navigator?.selectItem(ItemSelected(item: note))
    }
}

