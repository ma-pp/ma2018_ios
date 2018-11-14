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
        let vc = ListItemController()
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}
