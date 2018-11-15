//
//  StartCoordinator.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

public class StartCoordinator: Coordinator {
    private let navigationController: UINavigationController
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let coordinator = ListFolderCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
