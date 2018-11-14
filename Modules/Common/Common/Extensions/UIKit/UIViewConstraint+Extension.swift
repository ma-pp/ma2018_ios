//
//  UIViewConstraint+Extension.swift
//  Common
//
//  Created by PondokiOS on 11/6/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

public extension UIView {
    public func embed(in targetView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        targetView.addSubview(self)
        
        topAnchor.constraint(equalTo: targetView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: targetView.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: targetView.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: targetView.rightAnchor).isActive = true
    }
}
