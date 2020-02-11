//
//  AlienCell.swift
//  TableView_Practice
//
//  Created by Jose Arellanes on 2/6/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class AlienCell: UITableViewCell{


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
      background.backgroundColor = #colorLiteral(red: 0.8186396956, green: 0.7955000997, blue: 1, alpha: 1)
      background.layer.cornerRadius = 5
      background.layer.masksToBounds = true
      background.translatesAutoresizingMaskIntoConstraints = false
      return background
    }()
}
