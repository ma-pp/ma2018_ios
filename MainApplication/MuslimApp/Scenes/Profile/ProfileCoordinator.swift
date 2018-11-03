//
//  ProfileCoordinator.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

protocol ProfileNavigator: Navigator {
    
}

class ProfileCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let presentedViewController = ProfileController()
        presentedViewController.navigator = self
        let nav = UINavigationController(rootViewController: presentedViewController)
        navigationController
            .topViewController?
            .present(nav, animated: true, completion: nil)
    }
    
    deinit {
        Logging.deallocate(self)
    }
}

extension ProfileCoordinator: ProfileNavigator {
    func back() {
        navigationController
            .topViewController?
            .presentedViewController?
            .dismiss(animated: true, completion: nil)
    }
}
