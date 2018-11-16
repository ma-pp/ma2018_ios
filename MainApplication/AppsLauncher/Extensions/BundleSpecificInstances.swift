//
//  UIViewController+Extension.swift
//  AppsLauncher
//
//  Created by PondokiOS on 11/16/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

extension UIView: BundleSpecificInstance {
    public static var bundle: Bundle? {
        return MODULE_BUNDLE
    }
}

extension UIViewController: BundleSpecificInstance {
    public static var bundle: Bundle? {
        return MODULE_BUNDLE
    }
}
