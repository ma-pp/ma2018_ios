//
//  Logging.swift
//  Common
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

public class Logging {
    public static func deallocate(_ anyObject: AnyObject) {
        print("Deallocate \(anyObject)")
    }
}
