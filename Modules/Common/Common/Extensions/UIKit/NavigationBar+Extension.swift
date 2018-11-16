//
//  NavigationBar+Extension.swift
//  Common
//
//  Created by PondokiOS on 11/16/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

public enum NavigationBarKind {
    case clear
    case solid(UIColor)
}

public extension UINavigationBar {
    public func configure(with kind: NavigationBarKind) {
        switch kind {
        case .clear:
            let image = UIImage()
            setBackgroundImage(image, for: .default)
            shadowImage = image
            backgroundColor = .clear
        case let .solid(color):
            let image = UIImage()
            shadowImage = image
            backgroundColor = color
            isTranslucent = false
        }
    }
}
