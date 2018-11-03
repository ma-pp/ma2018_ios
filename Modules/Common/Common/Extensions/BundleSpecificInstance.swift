//
//  BundleSpecificInstance.swift
//  Common
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

/*
 Implement this protocol in each bundle/module
 */
public protocol BundleSpecificInstance {
    static var bundle: Bundle? { get }
}
