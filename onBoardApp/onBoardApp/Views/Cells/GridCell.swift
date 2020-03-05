//
//  GridCell.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/24/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class GridCell: UICollectionViewCell {
    static var identifier: String = "GridCell"
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        
    }
    func setup() {
        mainView.layer.cornerRadius = 10.0
    }
}
