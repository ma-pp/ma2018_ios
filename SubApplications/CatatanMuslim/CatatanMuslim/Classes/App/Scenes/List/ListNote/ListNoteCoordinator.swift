//
//  ListNoteCoordinator.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

class ListNoteCoordinator: ListItemCoordinator {
    init(navigationController: UINavigationController) {
        super.init(
            navigationController: navigationController,
            context: ListNoteContext()
        )
    }
    
    override func start() {
        super.start()
    }
}
