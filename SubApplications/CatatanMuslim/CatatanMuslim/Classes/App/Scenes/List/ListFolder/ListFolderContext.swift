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
    init(navigator: ListItemNavigator) {
        let presenter = ListFolderPresenter()
        
        let dataSource = ListFolderDataSource(provider: presenter)
        
        let delegate = ListFolderDelegate()
        delegate.navigator = navigator
        
        delegate.itemSelector = { (indexPath: IndexPath) -> Folder in
            return presenter.folders[indexPath.row]
        }
        
        self.tableViewSetup = ListFolderTableViewSetup(
            dataSource: dataSource,
            delegate: delegate
        )
        self.presenter = presenter
    }
}
