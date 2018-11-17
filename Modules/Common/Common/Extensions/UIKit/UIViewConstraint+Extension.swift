//
//  UIViewConstraint+Extension.swift
//  Common
//
//  Created by PondokiOS on 11/6/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

public extension UIView {
    public func embed(in targetView: UIView, inset: UIEdgeInsets = .zero ) {
        translatesAutoresizingMaskIntoConstraints = false
        targetView.addSubview(self)
        
        topAnchor
            .constraint(equalTo: targetView.topAnchor,
                        constant: inset.top)
            .isActive = true
        bottomAnchor
            .constraint(equalTo: targetView.bottomAnchor,
                        constant: inset.bottom)
            .isActive = true
        leftAnchor
            .constraint(equalTo: targetView.leftAnchor,
                        constant: inset.left)
            .isActive = true
        rightAnchor
            .constraint(equalTo: targetView.rightAnchor,
                        constant: -inset.right)
            .isActive = true
    }
}
