//
//  AppDelegate.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/2/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Logging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Logging.setupLogging()
        Logging.log(.info("Success Setup Logging!"))
        
        do {
            let window = UIWindow(frame: UIScreen.main.bounds)
            let application = Application.shared
            try application.start(window: window)
            self.window = window
        } catch _ {
            Logging.log(.error("Failed to start app!"))
        }
        
        return true
    }
}

