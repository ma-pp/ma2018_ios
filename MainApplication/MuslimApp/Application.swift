//
//  Application.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/2/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
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
        
        let homeCoordinator = HomeCoordinator(navigationController: nav)
        homeCoordinator.start()
    }
    
    private func basicAssertionCheck() {
        class __AnyView__: UIView {}
        assert( __AnyView__.bundle?.bundleIdentifier == BUNDLE_IDENTIFIER)
    }
}
