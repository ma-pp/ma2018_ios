//
//  NoteCell.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

typealias NoteCellConfigured = CellConfigurator<NoteCell, NoteCell.Data>

class NoteCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension NoteCell: IReusableCell {
    struct Data {
        let title: String
    }
    
    func configureCell(with item: Data) {
        textLabel?.text = item.title
    }
}
