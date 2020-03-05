//
//  TableViewCell.swift
//  MobExameProject
//
//  Created by Jose Arellanes on 3/3/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell{

    @IBOutlet weak var NameLastlabel: UILabel!
    
    @IBOutlet weak var Age: UILabel!
    static let identifier = "TableViewCell"

       static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
       }

    func setCell(nameLast: String, Age:Int){
        self.NameLastlabel.text = nameLast
        self.Age.text = String(Age)
    }
      override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }
    
}
