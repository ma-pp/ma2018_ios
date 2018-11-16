//
//  Date+Extension.swift
//  Common
//
//  Created by PondokiOS on 11/16/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

// If this considered harmfull in matter of performance, thread safety, etc
// please to edit!
fileprivate let dateFormatter = DateFormatter()

public extension Date {
    func toString(format: String) -> String? {
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
