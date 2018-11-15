//
//  BadgedButton.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

class BadgedButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    let badge: BadgeView = BadgeView()
    
    private func commonInit() {
        addSubview(badge)
        badge.layoutSubviews()
        bringSubview(toFront: badge)
    }
}
