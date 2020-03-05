//
//  TitleCell.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/24/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit


class TitleCell: UICollectionViewCell {
    static var identifier: String = "TitleCell"
    @IBOutlet private var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func set(title: String) {
        lblTitle.text = title
    }

}
