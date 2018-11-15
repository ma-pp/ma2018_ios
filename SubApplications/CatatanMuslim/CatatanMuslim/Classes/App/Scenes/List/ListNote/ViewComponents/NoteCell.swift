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
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var privacy: UILabel!
    @IBOutlet weak var dateUpdated: UILabel!
    @IBOutlet weak var unreadState: UILabel!
    @IBOutlet weak var content: UILabel!
    
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
        let author: String
        let privacy: Privacy
        let dateUpdated: Date
        let isUnread: Bool
        let content: String
    }
    
    func configureCell(with item: Data) {
        title.text = item.title
        author.text = item.author
        dateUpdated.text = "\(item.dateUpdated)"
        unreadState.text = item.isUnread ? "Unread" : ""
        content.text = item.content
    }
}
