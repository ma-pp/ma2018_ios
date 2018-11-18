//
//  Folder+Extension.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/17/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import Common

extension Folder: NewRecord {
    struct New {
        let title: String
        let privacy: Privacy
        let description: String
    }
}
