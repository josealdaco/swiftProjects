//
//  UserTableCell.swift
//  MobExam13
//
//  Created by Jose Arellanes on 3/3/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    static let identifier: String = "UserCell"
    
    let nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let ageLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
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
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(ageLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 20),
            ageLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.25),
            ageLabel.leadingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor, constant: 20),
            ageLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 20),
            ageLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            ageLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 5),
        ])
    }
    
    func populateCell(user: User) {
        nameLabel.text = "\(user.firstName) \(user.lastName)"
        ageLabel.text = "\(user.age)"
    }
}
