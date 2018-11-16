//
//  ProfileController.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

class ProfileController: UIViewController {
    
    var navigator: ProfileNavigator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupNavigationItem()
    }
    
    private func setupNavigationItem() {
        title = "Profil"
        
        navigationItem.defaultBackBarButton(self, selector: #selector(navigatorBack))
    }
    
    @objc private func navigatorBack() {
        navigator.back()
    }
}
