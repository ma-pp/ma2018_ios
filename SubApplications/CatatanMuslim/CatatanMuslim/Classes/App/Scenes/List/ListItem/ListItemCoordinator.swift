//
//  ListItemCoordinator.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Logging

protocol ListItemNavigator: Navigator {
    func selectItem<T>(_ item: T) where T: ListItemSelected
    func editItem<T>(_ item: T) where T: ListItemSelected
    func newItem<T>(_ type: T.Type) where T: ListItemSelected
}

class ListItemCoordinator: Coordinator, ListItemNavigator {
    private let navigationController: UINavigationController
    private let context: ListItemContext?
    init(navigationController: UINavigationController,
         context: ListItemContext? ) {
        self.navigationController = navigationController
        self.context = context
    }
    
    func start() {
        guard let context = context else { return }
        
        let vc = ListItemController()
        vc.presenter = context.presenter
        vc.navigator = self
        vc.setupTableView(with: context.tableViewSetup)
        navigationController.pushViewController(
            vc,
            animated: true
        )
    }
    
    // MARK: Navigator
    // Couldn't override declaration from extension
    
    func back() {
        navigationController.popViewController(animated: true)
    }
    
    func selectItem<T>(_ item: T) where T : ListItemSelected {
        fatalError("Not yet implemented!")
    }
    
    func editItem<T>(_ item: T) where T : ListItemSelected {
        fatalError("Not yet implemented!")
    }
    
    func newItem<T>(_ type: T.Type) where T : ListItemSelected {
        fatalError("Not yet implemented!")
    }
    
    deinit {
        CustomLogging.deallocate(self)
    }
}
