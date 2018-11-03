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
    static func nib(from bundle: Bundle?) -> UINib?
    
    func configureCell(with item: Data)
}

public extension IReusableCell {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    public static func nib(from bundle: Bundle?) -> UINib? {
        guard bundle?
            .path(forResource: reuseIdentifier,
                  ofType: "nib") != nil else {
               fatalError("Resource not found")
        }
        
        return UINib(nibName: String(describing: self), bundle: bundle)
    }
}


