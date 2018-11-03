//
//  NotificationController.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

class NotificationController: UIViewController {
    
    var navigator: NotificationNavigator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupNavigationItem()
    }
    
    private func setupNavigationItem() {
        title = "Notification"
        
        navigationItem.defaultCloseBarButton(self, selector: #selector(navigatorBack))
    }
    
    @objc func navigatorBack() {
        navigator.back()
    }
    
    
    deinit {
        Logging.deallocate(self)
    }
}
