//
//  RegistrationCoordinator.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/4/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

protocol RegistrationNavigator: Navigator {
}

class RegistrationCoordinator: Coordinator {
    private let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RegistrationController()
        viewController.navigator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension RegistrationCoordinator: RegistrationNavigator {
    func back() {
        navigationController.popViewController(animated: true)
    }
}
