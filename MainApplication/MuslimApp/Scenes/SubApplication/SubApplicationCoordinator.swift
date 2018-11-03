//
//  SubApplicationCoordinator.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import SubApplication

class SubApplicationCoordinator: Coordinator {
    let navigationController: UINavigationController
    let item: SubApplication
    
    init(navigationController: UINavigationController, item: SubApplication) {
        self.navigationController = navigationController
        self.item = item
    }
    
    func start() {
        let viewController = item.prepareController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
