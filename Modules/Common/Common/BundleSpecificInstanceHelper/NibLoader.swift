//
//  NibLoader.swift
//  Common
//
//  Created by PondokiOS on 11/16/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

public class NibLoader {
    private init() {}
    public static func load(for anyClass: AnyClass) -> UINib? {
        return UINib(
            nibName: String(describing: anyClass),
            bundle: BundleResolver.bundle(for: anyClass)
        )
    }
    
    public static func load<T>(_ :T.Type) -> T? {
        guard let anyClass = T.self as? AnyClass else {
            fatalError("Must be a class!")
        }
        return BundleResolver.bundle(for: anyClass )?
            .loadNibNamed(
                String(describing: T.self),
                owner: T.self,
                options: nil)?
            .first as? T
    }
    
    public static func loadController<T>() -> T? where T: UIViewController {
        return T(
            nibName: String(describing: T.self),
            bundle: BundleResolver.bundle(for: T.self)
        )
    }
}
