//
//  HomeCoordinator.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import SubApplication
import Common

protocol HomeNavigator: Navigator {
    func launchProfile()
    func launchNotification()
    func launchSubApplication(_ item: SubApplication)
}

class HomeCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let vc : HomeController = NibLoader.loadController() else {
            fatalError("Instance not found!")
        }
        vc.navigator = self
        vc.presenter = HomePresenter()
        navigationController.pushViewController(vc, animated: true)
    }
}

extension HomeCoordinator: HomeNavigator {
    func back() {
        navigationController.popViewController(animated: true)
    }
    
    func launchProfile() {
        let profileCoordinator = ProfileCoordinator(
            navigationController: navigationController
        )
        profileCoordinator.start()
    }
    
    func launchNotification() {
        let notificationCoordinator = NotificationCoordinator(
            navigationController: navigationController
        )
        notificationCoordinator.start()
    }
    
    func launchSubApplication(_ item: SubApplication) {
        let subApplicationCoordinator = SubApplicationCoordinator(
            navigationController: navigationController,
            item: item
        )
        subApplicationCoordinator.start()
    }
}
