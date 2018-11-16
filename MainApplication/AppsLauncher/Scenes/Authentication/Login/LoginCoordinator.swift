//
//  LoginCoordinator.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

protocol LoginNavigator: Navigator {
    func launchRegistration()
    func launchHomeLauncher()
}

class LoginCoordinator: Coordinator {
    private let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let viewController: LoginController = NibLoader.loadController() else {
            fatalError("Instance not found!")
        }
        viewController.navigator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension LoginCoordinator: LoginNavigator {
    func back() {
        // No back
    }
    
    func launchHomeLauncher() {
        let homeCoordinator = HomeCoordinator(
            navigationController: navigationController
        )
        homeCoordinator.start()
    }
    
    func launchRegistration() {
        let registrationCoordinator = RegistrationCoordinator(
            navigationController: navigationController
        )
        registrationCoordinator.start()
    }
}
