//
//  ListItemDataSource.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

class ListItemDataSource: NSObject, UITableViewDataSource {
    let provider: ConfiguratorProvider
    init(provider: ConfiguratorProvider) {
       self.provider = provider
    }
    
    var items: [ICellConfigurator] {
        return provider.items
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: item.reuseIdentifier,
            for: indexPath
        )
        
        item.configure(view: cell)
        
        return cell
    }
}
