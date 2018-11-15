//
//  CircleView.swift
//  Common
//
//  Created by PondokiOS on 11/14/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

@IBDesignable
public class RoundedView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
