//
//  ListFolderCoordinator.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

class ListFolderCoordinator: ListItemCoordinator {
    init(navigationController: UINavigationController) {
        super.init(
            navigationController: navigationController,
            context: ListFolderContext()
        )
    }
    
    override func start() {
        super.start()
    }
}
