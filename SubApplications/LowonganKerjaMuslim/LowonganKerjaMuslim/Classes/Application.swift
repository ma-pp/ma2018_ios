//
//  Application.swift
//  LowonganKerjaMuslim
//
//  Created by PondokiOS on 11/2/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import SubApplication

public class Application: SubApplication {
    public var thumbnail: UIImage? = nil
    
    public func prepareController() -> UIViewController {
        fatalError()
    }
    
    public let title = "Loker Muslim"
    
    public init() {}
}
