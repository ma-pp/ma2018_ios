//
//  Application.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/2/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

fileprivate enum ApplicationError: Error {
    case windowNotSet
}

class Application {
    static let shared = Application()
    private init() {}
    
    func start(window: UIWindow) throws {
        let home = HomeController()
        window.rootViewController = home
        window.makeKeyAndVisible()
    }
}

