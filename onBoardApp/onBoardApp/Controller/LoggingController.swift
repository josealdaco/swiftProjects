//
//  LoggingController.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/24/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class LoggingController: UIViewController {
    
    var titleConstraintStart: NSLayoutConstraint!
    var titleConstraintEnd: NSLayoutConstraint!
    
    
    
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "PetBox"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont(name: "Marker Felt", size: 80)
        return label
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
        button.isHidden = true
        return button
    }()
    
    let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "box")
        return imageView
    }()
    
   let usernameTextField: SimpleTextField = {
           let textField = SimpleTextField(placeholder: "username")
           return textField
       }()
       
       let passwordTextField: SimpleTextField = {
           let textField = SimpleTextField(placeholder: "password")
           textField.isSecureTextEntry = true
           return textField
       }()
       
    
    override func viewDidAppear(_ animated: Bool) {
        titleConstraintStart.isActive = false
        titleConstraintEnd.isActive = true
        UIView.animate(withDuration: 1.5, delay: 0.5, options: [], animations: {
            self.view.layoutIfNeeded()
            self.appNameLabel.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
              DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                     self.continueButton.isHidden = false
                
                     }
        },completion: nil)
        
//        UIView.animate(withDuration: 1.0) {
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//        self.continueButton.isHidden = false
//            }
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.4039215686, blue: 1, alpha: 1)
        setImageView()
        setLabel()
        setButton()
        setTextFields()
        
    }

    func setImageView(){
        self.view.addSubview(mainImage)
        mainImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mainImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -20).isActive = true
    }

    func setLabel(){
        self.view.addSubview(appNameLabel)
        appNameLabel.centerYAnchor.constraint(equalTo: mainImage.topAnchor, constant: -60).isActive = true
        appNameLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        appNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        appNameLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
        titleConstraintEnd = appNameLabel.centerYAnchor.constraint(equalTo: mainImage.topAnchor, constant: -60)
        titleConstraintStart = appNameLabel.centerYAnchor.constraint(equalTo: mainImage.centerYAnchor, constant: 5)
        titleConstraintStart.isActive = true

    }
    
    func setButton(){
        self.view.addSubview(continueButton)
        continueButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        continueButton.addTarget(self, action: #selector(showHome), for: .touchUpInside)
    }
    
    func setTextFields(){
        self.view.addSubview(usernameTextField)
        usernameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        usernameTextField.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 30).isActive = true
        usernameTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75).isActive = true
        
        self.view.addSubview(passwordTextField)
        passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 15).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75).isActive = true
    }
    
    @objc func showHome(){
       let navigationController = UINavigationController(rootViewController: HomePage() )
        navigationController.topViewController?.title = "HOME SCREEN"
        self.view.window!.rootViewController = navigationController //you can set it as root
    }
    
}
