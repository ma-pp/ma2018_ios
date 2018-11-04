//
//  LoginController.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var navigator: LoginNavigator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        loginButton.addTarget(self, action: #selector(performValidation), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(launchRegistration), for: .touchUpInside)
    }
    
    @objc private func performValidation() {
        navigator.launchHomeLauncher()
    }
    
    @objc private func launchRegistration() {
        navigator.launchRegistration()
    }
}
