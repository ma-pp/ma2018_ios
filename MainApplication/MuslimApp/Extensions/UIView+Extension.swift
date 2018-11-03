//
//  UIView+Extension.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

extension UIView: BundleSpecificInstance {
    public static var bundle: Bundle? {
        return MODULE_BUNDLE
    }
}
