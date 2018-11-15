//
//  ConfiguratorProvider.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import Common

protocol ConfiguratorProvider: class {
    var items: [ICellConfigurator] { get }
}
