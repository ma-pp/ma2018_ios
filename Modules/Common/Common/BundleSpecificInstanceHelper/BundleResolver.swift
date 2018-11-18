//
//  BundleResolver.swift
//  Common
//
//  Created by PondokiOS on 11/16/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

class BundleResolver {
    private init() {}
    
    static func bundle(for anyClass: AnyClass) -> Bundle? {
        return Bundle(for: anyClass)
    }
    
    static func bundle(for identifier: String) -> Bundle? {
        return Bundle(identifier: identifier)
    }
}
