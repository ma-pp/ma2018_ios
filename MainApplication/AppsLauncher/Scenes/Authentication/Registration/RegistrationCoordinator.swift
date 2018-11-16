//
//  RegistrationCoordinator.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/4/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

protocol RegistrationNavigator: Navigator {
}

public class RegistrationCoordinator: Coordinator {
    private let navigationController: UINavigationController
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        guard let viewController: RegistrationController = .loadInstance() else {
            fatalError("Instance not found!")
        }
        viewController.navigator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension RegistrationCoordinator: RegistrationNavigator {
    func back() {
        navigationController.popViewController(animated: true)
    }
}
