//
//  Application.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import SubApplication

public final class Application: SubApplication {
    public var thumbnail: UIImage? = UIImage(
        named: "thumbnail_home",
        in: Constant.bundle,
        compatibleWith: nil
    )
    
    public func prepareController() -> UIViewController {
        fatalError()
    }
    
    public let title = "Catatan Muslim"
    public init() {}
}
