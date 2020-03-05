//
//  Cell.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/18/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    static var identifier: String = "Cell"
    var itemButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Layout views inside the cell
        let itemButton = UIButton(type: .system)
        itemButton.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(itemButton)
        
        // Aplying constraints
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: itemButton.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: itemButton.centerYAnchor),
            ])
        
        // Customization
        self.itemButton = itemButton
//        self.itemButton.setTitle("", for: .normal)
        self.itemButton.layer.cornerRadius = 12.0
        self.itemButton.backgroundColor = .purple
        NSLayoutConstraint.activate([
            self.itemButton.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 1),
            self.itemButton.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1)
        ])

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}
