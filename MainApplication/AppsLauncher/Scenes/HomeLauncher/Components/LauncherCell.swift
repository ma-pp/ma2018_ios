//
//  LauncherCell.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import SubApplication
import Common

class LauncherCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension LauncherCell: IReusableCell {
    typealias Data = SubApplication
    
    func configureCell(with item: SubApplication) {
        title.text = item.title
        thumbnail.image = item.thumbnail
    }
}
