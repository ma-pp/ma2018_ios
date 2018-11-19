//
//  Application.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/2/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import AppsLauncher
import Common

fileprivate enum ApplicationError: Error {
    case windowNotSet
}

final class Application {
    static let shared = Application()
    private init() {}
    
    func start(window: UIWindow) throws {
        basicAssertionCheck()
        
        let nav = UINavigationController()
        window.rootViewController = nav
        window.makeKeyAndVisible()
        
        let firstCoordinator = AppsLauncher.instantiateFirstCoordinator(with: nav)
        firstCoordinator.start()
    }
    
    private func basicAssertionCheck() {
    }
    
    
    lazy var currentUser: Bool? = {
        return nil
    }()
}
