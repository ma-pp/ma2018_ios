//
//  ListItemCoordinator.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

protocol ListItemNavigator: Navigator {
    
}

class ListItemCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private let context: ListItemContext
    init(navigationController: UINavigationController,
         context: ListItemContext ) {
        self.navigationController = navigationController
        self.context = context
    }
    
    func start() {
        let vc = ListItemController()
        vc.presenter = context.presenter
        vc.navigator = self
        vc.setupTableView(with: context.tableViewSetup)
        navigationController.pushViewController(
            vc,
            animated: true
        )
    }
}

extension ListItemCoordinator: ListItemNavigator {
    func back() {
        navigationController.popViewController(animated: true)
    }
}
