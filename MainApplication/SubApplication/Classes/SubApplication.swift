//
//  SubApplication.swift
//  SubApplication
//
//  Created by PondokiOS on 11/2/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

public protocol SubApplication {
    var title: String { get }
    var thumbnail: UIImage? { get }
    func prepareController() -> UIViewController
    init()
}
