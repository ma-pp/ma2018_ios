//
//  BadgeView.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/14/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

fileprivate let kBadgeViewMinimumSize: CGFloat = 5

public class BadgeView: UIView {
    
    var color: UIColor = .red
    var size: CGFloat = 0.0
    
    var topPadding: CGFloat = 0.0
    var rightPadding: CGFloat = 0.0
    
    public override func layoutSubviews(){
        super.layoutSubviews()
        
        layoutBadge()
    }
    
    private func layoutBadge() {
        backgroundColor = color
        guard let superview = superview else { return }
        let superviewWidth = superview.frame.width
        
        let size = max(self.size, kBadgeViewMinimumSize)
        
        frame = CGRect(
            x: superviewWidth - rightPadding,
            y: 0 + topPadding,
            width: size,
            height: size
        )
        
        self.layer.cornerRadius = size / 2
    }
    
    public func show() {
        self.isHidden = false
    }
    
    public func hide() {
        self.isHidden = true
    }
}
