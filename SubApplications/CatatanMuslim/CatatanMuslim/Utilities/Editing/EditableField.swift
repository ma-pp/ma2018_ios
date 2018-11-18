//
//  EditableField.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/17/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

protocol EditableBuilder {
    associatedtype T
    func build(old: T) -> T
}

protocol Editable {
    associatedtype EditableField: EditableBuilder where EditableField.T == Self
}

struct EditableField<T> where T: Editable {
    
    var field: T.EditableField
    
    func build(from old: T) -> T {
        return field.build(old: old)
    }
}
