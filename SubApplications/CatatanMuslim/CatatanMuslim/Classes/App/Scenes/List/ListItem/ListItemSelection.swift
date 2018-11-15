//
//  ListItemSelection.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

protocol ListItemSelection {
    associatedtype Item
    var item: Item { get set }
}
