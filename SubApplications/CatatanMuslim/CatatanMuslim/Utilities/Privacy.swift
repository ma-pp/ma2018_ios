//
//  Privacy.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

enum Privacy: Int {
    case `public` = 0
    case `private`
    case onlyMe
    
    static let `default` = Privacy.public
}
