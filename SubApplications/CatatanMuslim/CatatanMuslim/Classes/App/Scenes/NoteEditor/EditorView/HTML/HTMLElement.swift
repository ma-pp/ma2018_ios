//
//  HTMLElement.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/21/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

enum HTMLElement {
    
    // MARK: TextFormatting
    
    case bold(content: String)
    case italic(content: String)
    
    // MARK: Tag
    
    case head(level: Int, content: String)
    case link(url: String, content: String)
    case paragraph(content: String)
}

protocol HTMLStringRepresentation  {
    var stringRepresentation: String { get }
}

extension HTMLElement: HTMLStringRepresentation {
    var stringRepresentation: String {
        switch self {
        case let .bold(content):
            return "<b>\(content)</b>"
        case let .italic(content):
            return "<em>\(content)</em>"
            
        case let .head(level, content):
            return "<h\(level)>\(content)</h\(level)>"
        case let .link(url, content):
            return "<a href=\"\(url)\">\(content)</a>"
        case let .paragraph(content):
            return "<p>\(content)</p>"
        }
    }
}

protocol HTMLContentParser {
    static func content(from string: String) -> String
}

extension HTMLElement: HTMLContentParser {
    static func content(from string: String) -> String {
        // TODO: Use REGEX!
        if string.contains("<h1>") {
            let deletedStartTag = string.replacingOccurrences(of: "<h1>", with: "")
            let deletedEndTag = deletedStartTag.replacingOccurrences(of: "</h1>", with: "")
            return deletedEndTag
        } else {
            fatalError()
        }
    }
}
