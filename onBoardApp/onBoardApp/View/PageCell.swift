//
//  PageCell.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 1/29/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    
     var page: Page?{
        didSet{
            guard  let unwrappedPage = page else {return}
            let attribute_Text = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 40)])
            attribute_Text.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]))
            worldImageView.image = UIImage(named: page!.imageName)
            header_Title.attributedText = attribute_Text
            header_Title.textAlignment = .center
        }
    }
    
    
    
    
    
     let login_Button: UIButton = {
              let next_Button = UIButton(type: .system)
              next_Button.setTitle("CONTINUE", for: .normal)
              next_Button.isHidden = true
              next_Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
              next_Button.setTitleColor(.white, for: .normal)
              next_Button.backgroundColor = UIColor.darkGray
              next_Button.translatesAutoresizingMaskIntoConstraints = false
            next_Button.layer.cornerRadius = 24
             return next_Button
          }()
       

    let worldImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "climate_change"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit // Keeps same size, regardless of screen ratio
        return imageView
    }()
    
    let header_Title: UITextView = {
        let header_Title = UITextView()
        let attribute_Text = NSMutableAttributedString(string: "Welcome to Climate Awareness", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)])
        
        // Add Additional Strings here
        attribute_Text.append(NSAttributedString(string: "\n\n\nThis App will bring Awareness to the World", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]))
        header_Title.attributedText = attribute_Text
        header_Title.textAlignment = .center
        header_Title.isEditable = false
        header_Title.isScrollEnabled = false
        header_Title.backgroundColor =  UIColor.purple;
        header_Title.translatesAutoresizingMaskIntoConstraints = false
       return header_Title
    }()
    
     private func Layout_Setup(){
           /* Container for elemets*/
               let container_View = UIView()
          addSubview(container_View)
           // Enable Auto Layout
           container_View.translatesAutoresizingMaskIntoConstraints = false
           container_View.topAnchor.constraint(equalTo: topAnchor).isActive = true
           container_View.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
           container_View.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
           // Height Constraints
           container_View.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
           container_View.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
              addSubview(worldImageView) // World Icon
           
           /*  Layout information for world Icon*/
           worldImageView.centerXAnchor.constraint(equalTo: container_View.centerXAnchor).isActive = true
           worldImageView.centerYAnchor.constraint(equalTo: container_View.centerYAnchor).isActive = true
           worldImageView.heightAnchor.constraint(equalTo: container_View.heightAnchor, multiplier: 0.5).isActive = true
           addSubview(header_Title)
            addSubview(login_Button)
           // Text View setup
           header_Title.topAnchor.constraint(equalTo:container_View.bottomAnchor).isActive = true
        header_Title.bottomAnchor.constraint(equalTo: login_Button.topAnchor, constant: 40).isActive = true
           header_Title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
           header_Title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        login_Button.topAnchor.constraint(equalTo: header_Title.bottomAnchor, constant: -30).isActive = true
        login_Button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        login_Button.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        login_Button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        login_Button.heightAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
       }
       
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        Layout_Setup()

        backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
