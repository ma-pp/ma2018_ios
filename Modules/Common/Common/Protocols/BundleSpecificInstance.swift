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
public protocol BundleSpecificInstance: class {
    static var bundle: Bundle? { get }
}

public extension BundleSpecificInstance {
    static func loadInstance<T>() -> T? where T: UIViewController {
        return T(
            nibName: "\(T.self)",
            bundle: bundle
        )
    }
}
