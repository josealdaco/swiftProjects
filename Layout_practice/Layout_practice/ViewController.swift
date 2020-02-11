//
//  ViewController.swift
//  Layout_practice
//
//  Created by Jose Arellanes on 1/21/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var exampleView: UIView!
    var redExampleView: UIView!
    override func loadView() {
           super.loadView()

           exampleView = UIView(frame: .zero)
           exampleView.translatesAutoresizingMaskIntoConstraints = false
           self.view.addSubview(exampleView)
           NSLayoutConstraint.activate([
               exampleView.widthAnchor.constraint(equalToConstant: 80),
               exampleView.heightAnchor.constraint(equalTo: exampleView.widthAnchor, multiplier: 1/1),
               exampleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
               exampleView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
               // Red square 2
           ])
         redExampleView = UIView(frame: .zero)
        redExampleView.translatesAutoresizingMaskIntoConstraints = false // Always set to zero
        self.view.addSubview(redExampleView)
        NSLayoutConstraint.activate([
            
            // red Square layout
            redExampleView.widthAnchor.constraint(equalToConstant: 160),
            redExampleView.heightAnchor.constraint(equalTo:  redExampleView.widthAnchor, multiplier: 1/1),
            redExampleView.topAnchor.constraint(equalTo: exampleView.centerYAnchor, constant: 80),
            redExampleView.centerXAnchor.constraint(equalTo: exampleView.centerXAnchor)
            
            
            ])
       }
    
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
       self.exampleView.backgroundColor = .blue
        self.redExampleView.backgroundColor = .red
        // Do any additional setup after loading the view.
    }

  

}

