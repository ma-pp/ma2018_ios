//
//  Global.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/16/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

extension Constant {
    enum StringDateFormat: String {
        case dayMonth = "dd MMM"
        case dayMonthYear = "dd MMM yyyy"
        
        func string(separator: String = " ") -> String {
            return rawValue.replacingOccurrences(of: " ", with: separator)
        }
        
    }
}
