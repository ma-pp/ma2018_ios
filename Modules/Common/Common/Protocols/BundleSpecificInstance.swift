//
//  BundleSpecificInstance.swift
//  Common
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

/*
 Implement this protocol in each bundle/module
 */
public protocol BundleSpecificInstance {
    static var bundle: Bundle? { get }
}

public extension BundleSpecificInstance where Self: UIView {
    static func load<T>(type: T.Type) -> T? where T: UIView {
        let nib = bundle?.loadNibNamed(
            String(describing: type),
            owner: type,
            options: nil
        )?.first as? T
        return nib
    }
}
