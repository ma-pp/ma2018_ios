//
//  CollectionView+Extension.swift
//  Common
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

public extension UICollectionView {
    public func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: IReusableCell {
        if let nib = T.nib(for: T.self) {
            self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T? where T: IReusableCell {
        let cell = self.dequeueReusableCell(
            withReuseIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as? T
        return cell
    }
}
