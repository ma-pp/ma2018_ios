//
//  ListNoteContext.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import Logging

class ListNoteContext {
    private var _presenter: ListItemPresenter?
    private var _tableViewSetup: ListItemTableViewSetup?
    
    init(navigator: ListItemNavigator, folder: Folder) {
        
        let presenter = ListNotePresenter(folder: folder)
        
        let dataSource = ListNoteDataSource(provider: presenter)
        
        let delegate = ListNoteDelegate()
        delegate.navigator = navigator
        
        delegate.itemSelector = { (indexPath: IndexPath) -> Note in
            return presenter.notes[indexPath.row]
        }
        
        _tableViewSetup = ListNoteTableViewSetup(
            dataSource: dataSource,
            delegate: delegate
        )
        _presenter = presenter
    }
    
    deinit {
        CustomLogging.deallocate(self)
    }
}

extension ListNoteContext: ListItemContext {
    var presenter: ListItemPresenter {
        guard let presenter = _presenter else {
            fatalError()
        }
        return presenter
    }
    
    var tableViewSetup: ListItemTableViewSetup {
        guard let tableViewSetup = _tableViewSetup else {
            fatalError()
        }
        return tableViewSetup
    }
}
