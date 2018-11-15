//
//  TableView+Extension.swift
//  Common
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

public extension UITableView {
    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: IReusableCell & BundleSpecificInstance {
        if let nib = T.nib(from: T.bundle) {
            self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
}

