//
//  RegistrationController.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/4/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confimPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    var navigator: RegistrationNavigator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        registerButton.addTarget(self, action: #selector(performRegistration), for: .touchUpInside)
    }
    
    @objc private func performRegistration() {
        // Currently
        navigator.back()
    }

}
