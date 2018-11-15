//
//  FolderCell.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

typealias FolderCellConfigured = CellConfigurator<FolderCell, FolderCell.Data>

class FolderCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var notesCount: UILabel!
    @IBOutlet weak var unreadCount: UILabel!
    @IBOutlet weak var privacy: UILabel!
    @IBOutlet weak var dateUpdated: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension FolderCell: IReusableCell {
    struct Data {
        let title: String
        let author: String
        let totalNotes: Int
        let totalUnread: Int
        let privacy: Privacy
        let dateUpdated: Date
    }
    
    func configureCell(with item: Data) {
        title.text = item.title
        author.text = item.author
        notesCount.text = "\(item.totalNotes) Notes"
        unreadCount.text = "\(item.totalUnread) Unread"
        dateUpdated.text = "\(item.dateUpdated)"
        
        switch item.privacy {
        case .public:
            privacy.text = "public"
        case .private:
            privacy.text = "private"
        case .onlyMe:
            privacy.text = "only me"
        }
    }
}
