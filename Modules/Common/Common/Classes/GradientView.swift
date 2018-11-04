//
//  GradientView.swift
//  Common
//
//  Created by PondokiOS on 11/4/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

@IBDesignable
public class GradientView: UIView {
    @IBInspectable
    public var startColor: UIColor = .clear
    
    @IBInspectable
    public var endColor: UIColor = .clear
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.zPosition = -1
        layer.addSublayer(gradientLayer)
        
    }
}
