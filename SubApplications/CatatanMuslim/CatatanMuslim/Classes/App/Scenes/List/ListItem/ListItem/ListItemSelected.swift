//
//  ListItemSelected.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

protocol ListItemSelected {
    associatedtype Item
    var item: Item { get }
}

struct ItemSelected<T>: ListItemSelected {
    let item: T
}
