//
//  SimpleTabBar.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/14/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

class SimpleTabBar: UIView {
    @IBOutlet weak var new: UIButton!
    // See XIB configuration!
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    func addButton(_ button: UIButton) {
        buttonsStackView.addArrangedSubview(button)
    }
}
