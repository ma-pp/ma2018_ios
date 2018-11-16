//
//  IReusableView.swift
//  Common
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

public protocol IReusableCell {
    associatedtype Data
    static var reuseIdentifier: String { get }
    static func nib<T>(for type: T.Type) -> UINib?
    
    func configureCell(with item: Data)
}

public extension IReusableCell {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static func nib<T>(for type: T.Type) -> UINib? {
        guard let anyClass = type as? AnyClass else {
            fatalError("Type must be class!")
        }
        return NibLoader.load(for: anyClass)
    }
}


