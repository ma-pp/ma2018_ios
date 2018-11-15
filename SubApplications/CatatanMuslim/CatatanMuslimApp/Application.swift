//
//  Application.swift
//  CatatanMuslimApp
//
//  Created by PondokiOS on 11/6/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import CatatanMuslim

final class Application {
    static let shared = Application()
    private init() {}
    
    func start(window: UIWindow) throws {
        let nav = ListNavigationController()
        window.rootViewController = nav
        window.makeKeyAndVisible()
        
        let firstCoordinator = instantiateFirstCoordinator(with: nav)
        firstCoordinator.start()
    }
    
    private func instantiateFirstCoordinator(
        with navigationController: UINavigationController
        ) -> Coordinator {
        return StartCoordinator(
            navigationController: navigationController
        )
    }
}
