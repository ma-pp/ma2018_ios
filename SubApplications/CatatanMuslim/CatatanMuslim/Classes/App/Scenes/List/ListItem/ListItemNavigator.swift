//
//  ListItemCoordinator.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

protocol ListItemNavigator: Navigator {
    func selectItem<T>(_ item: T) where T: ListItemSelected
    func editItem<T>(_ item: T) where T: ListItemSelected
    func newItem<T>(_ type: T.Type) where T: ListItemSelected
}
