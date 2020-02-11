//
//  ViewController.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 1/28/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

var world = UIImage(named: "climate_change")
    let worldImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "climate_change"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit // Keeps same size, regardless of screen ratio
        return imageView
    }()
    
    // Button Controll
    private let previous_Button: UIButton = {
        let back_Button = UIButton(type: .system)
        back_Button.setTitle("Prev", for: .normal)
        back_Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        back_Button.setTitleColor(UIColor.gray, for: .normal)
        back_Button.translatesAutoresizingMaskIntoConstraints = false
       return back_Button
    }()
    
    private let next_Button: UIButton = {
           let next_Button = UIButton(type: .system)
           next_Button.setTitle("Next", for: .normal)
           next_Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        next_Button.setTitleColor(.mainGreen, for: .normal)
           next_Button.translatesAutoresizingMaskIntoConstraints = false
          return next_Button
       }()
    
    private let pageControl: UIPageControl = {
        let page_Controll = UIPageControl()
        page_Controll.currentPage = 0
        page_Controll.numberOfPages = 4
        page_Controll.pageIndicatorTintColor = UIColor.tintedGray
        page_Controll.currentPageIndicatorTintColor = UIColor.mainGreen
       return page_Controll
    }()
    
    // Header Under Icon
    let header_Title: UITextView = {
        let header_Title = UITextView()
        let attribute_Text = NSMutableAttributedString(string: "Welcome to Climate Awareness", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        
        // Add Additional Strings here
        attribute_Text.append(NSAttributedString(string: "\n\n\nThis App will bring Awareness to the World", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.white]))
        header_Title.attributedText = attribute_Text
        header_Title.textAlignment = .center
        header_Title.isEditable = false
        header_Title.isScrollEnabled = false
        header_Title.backgroundColor = UIColor.darkGray
        header_Title.translatesAutoresizingMaskIntoConstraints = false
       return header_Title
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Entry Point
        view.addSubview(header_Title) // Header Title
       Layout_Setup()
        botton_Controlls()
        // background Color
        self.view.backgroundColor = UIColor.darkGray
    }

    fileprivate func botton_Controlls(){
        /* This will controll the controllers at the bottom*/
        //view.addSubview(previous_Button)
        let controllsStackView = UIStackView(arrangedSubviews: [previous_Button,pageControl, next_Button])
        controllsStackView.translatesAutoresizingMaskIntoConstraints = false
        controllsStackView.distribution = .fillEqually
        view.addSubview(controllsStackView)
        NSLayoutConstraint.activate([
            controllsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            controllsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            controllsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            controllsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func Layout_Setup(){
        /* Container for elemets*/
            let container_View = UIView()
        container_View.backgroundColor = UIColor.green
        view.addSubview(container_View)
        // Enable Auto Layout
        container_View.translatesAutoresizingMaskIntoConstraints = false
        container_View.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        container_View.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        container_View.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        // Height Constraints
        container_View.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        container_View.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
           view.addSubview(worldImageView) // World Icon
        
        /*  Layout information for world Icon*/
        worldImageView.centerXAnchor.constraint(equalTo: container_View.centerXAnchor).isActive = true
        worldImageView.centerYAnchor.constraint(equalTo: container_View.centerYAnchor).isActive = true
        worldImageView.heightAnchor.constraint(equalTo: container_View.heightAnchor, multiplier: 0.5).isActive = true
        
        // Text View setup
        header_Title.topAnchor.constraint(equalTo:container_View.bottomAnchor).isActive = true
        header_Title.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        header_Title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        header_Title.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
    }
    

}



