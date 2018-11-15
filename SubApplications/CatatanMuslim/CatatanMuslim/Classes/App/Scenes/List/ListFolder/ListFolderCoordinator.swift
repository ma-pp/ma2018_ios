//
//  ListFolderCoordinator.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

class ListFolderCoordinator: ListItemCoordinator {
    private let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init(
            navigationController: navigationController,
            context: ListFolderContext()
        )
    }
    
    override func start() {
        super.start()
    }
}
