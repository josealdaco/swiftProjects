//
//  favoriteBoxes.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/18/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class FavoriteBoxes: UITableViewCell{


//initializer for a cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.setup()
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setup()
}

func setup() {
    self.contentView.addSubview(background)
    background.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
    background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    background.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
    background.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    

}
    
    let background : UIView = {
    let background = UIView()
      background.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
      background.layer.cornerRadius = 5
      background.layer.masksToBounds = true
      background.translatesAutoresizingMaskIntoConstraints = false
      return background
    }()
    
}
