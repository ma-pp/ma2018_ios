//
//  AppsLauncher.swift
//  AppsLauncher
//
//  Created by PondokiOS on 11/16/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

public func instantiateFirstCoordinator(with nav: UINavigationController) -> Coordinator {
    guard false else {
        return LoginCoordinator(navigationController: nav)
    }
    return HomeCoordinator(navigationController: nav)
}
