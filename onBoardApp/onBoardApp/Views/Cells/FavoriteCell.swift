//
//  FavoriteCell.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/24/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    static var identifier: String = "FavoritesCell"
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
        imgView.layer.cornerRadius = 10
    }
    
}
