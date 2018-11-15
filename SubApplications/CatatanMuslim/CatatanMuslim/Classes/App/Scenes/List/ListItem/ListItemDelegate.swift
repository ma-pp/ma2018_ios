//
//  ListItemDelegate.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

class ListItemDelegate: NSObject, UITableViewDelegate {
    let provider: ConfiguratorProvider
    
    init(provider: ConfiguratorProvider) {
        self.provider = provider
    }
    
    var items: [ICellConfigurator] {
        return provider.items
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}


