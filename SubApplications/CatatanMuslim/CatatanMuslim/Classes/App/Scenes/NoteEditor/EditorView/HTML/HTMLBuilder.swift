//
//  HTMLBuilder.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/21/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

class HTMLBuilder {
    private(set) var htmlElementsStack: [HTMLStringRepresentation] = []
    
    func add(_ element: HTMLElement) {
        htmlElementsStack.append(element)
    }
    
    func build() -> String {
        return htmlElementsStack.reduce("", { $0 + $1.stringRepresentation })
    }
}
