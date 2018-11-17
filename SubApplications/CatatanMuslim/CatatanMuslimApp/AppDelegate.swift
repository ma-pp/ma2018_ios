//
//  AppDelegate.swift
//  CatatanMuslimApp
//
//  Created by PondokiOS on 11/6/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Logging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        do {
            setupThirdPartyLibrary()
            
            let window = UIWindow(frame: UIScreen.main.bounds)
            try Application.shared.start(window: window)
            self.window = window
        } catch _ {
            Logging.log(.error("Failed to start App!"))
        }
        
        return true
    }
    
    private func setupThirdPartyLibrary() {
        IQKeyboardManager.shared.enable = true
    }

}
