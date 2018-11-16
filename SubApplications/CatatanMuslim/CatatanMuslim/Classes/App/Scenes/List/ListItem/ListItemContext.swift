//
//  ListItemContext.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

protocol ListItemContext {
    var presenter: ListItemPresenter { get }
    var tableViewSetup: ListItemTableViewSetup { get }
}
