//
//  CellConfigurator.swift
//  Common
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation

public protocol ICellConfigurator {
    var reuseIdentifier: String { get }
    func configure(view: UIView)
}

public struct CellConfigurator<Cell, Data> where Cell: IReusableCell, Data == Cell.Data {
    private let data: Data
    public init(data: Data) {
        self.data = data
    }
    
    private func configure(cell: Cell) {
        cell.configureCell(with: data)
    }
}


extension CellConfigurator: ICellConfigurator {
    public var reuseIdentifier: String {
        return String(describing: Cell.self)
    }
    
    public func configure(view: UIView) {
        guard let cell = (view as? Cell) else { return }
        self.configure(cell: cell)
    }
}
