//
//  InputAccesory.swift
//  Common
//
//  Created by PondokiOS on 11/17/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

public class InputAccesory: UIView {
    
    private let stackView = UIStackView()
    
    private(set) var buttons: [UIButton] = []
    public convenience init(buttons: [UIButton]) {
        self.init(frame: .zero)
        self.buttons = buttons
        layoutIfNeeded()
    }
    
    public override func layoutIfNeeded() {
        super.layoutIfNeeded()
        buttons.forEach({
            stackView.addArrangedSubview($0)
        })
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.embed(
            in: self,
            inset: UIEdgeInsets(
                top: 0,
                left: 10,
                bottom: 0,
                right: 10
            )
        )
    }
}
