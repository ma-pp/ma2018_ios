//
//  TableView+Extension.swift
//  Common
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

public extension UITableView {
    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: IReusableCell {
        if let nib = T.nib(for: T.self) {
            self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
}

