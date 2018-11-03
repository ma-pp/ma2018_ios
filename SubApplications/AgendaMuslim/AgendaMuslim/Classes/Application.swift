//
//  Application.swift
//  AgendaMuslim
//
//  Created by PondokiOS on 11/2/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
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
    
    public let title = "Agenda Muslim"
    public init() {}
}
