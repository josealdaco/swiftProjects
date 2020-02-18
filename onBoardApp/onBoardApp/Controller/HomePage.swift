//
//  HomePage.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/11/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class HomePage: UIViewController {
    
    private let newBox: UIButton = {
              let back_Button = UIButton(type: .system)
              back_Button.setTitle("NEW BOX", for: .normal)
              back_Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
              back_Button.setTitleColor(UIColor.white, for: .normal)
              back_Button.backgroundColor = .purple
              back_Button.layer.cornerRadius = 100.0
        back_Button.addTarget(self, action: #selector(newBoxesWindow), for: .touchUpInside)
              back_Button.translatesAutoresizingMaskIntoConstraints = false
             return back_Button
          }()
          
          private let pastBoxes: UIButton = {
                 let next_Button = UIButton(type: .system)
                 next_Button.setTitle("Past Boxes", for: .normal)
                 next_Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
              next_Button.setTitleColor(.white, for: .normal)
            next_Button.layer.cornerRadius = 100.0

            next_Button.backgroundColor = .purple
            next_Button.addTarget(self, action: #selector(pastBoxesWindow), for: .touchUpInside)

                 next_Button.translatesAutoresizingMaskIntoConstraints = false
                return next_Button
             }()
       
           private let profile: UIButton = {
               let next_Button = UIButton(type: .system)
               next_Button.setTitle("Profile", for: .normal)
               next_Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
            next_Button.setTitleColor(.white, for: .normal)
            next_Button.layer.cornerRadius = 100.0
            next_Button.backgroundColor = .purple
            next_Button.addTarget(self, action: #selector(profileWindow), for: .touchUpInside)

               next_Button.translatesAutoresizingMaskIntoConstraints = false
              return next_Button
           }()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.botton_Controlls()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func botton_Controlls(){
        /* This will controll the controllers at the bottom*/
        //view.addSubview(previous_Button)
        let controllsStackView = UIStackView(arrangedSubviews: [newBox, pastBoxes, profile])
        controllsStackView.translatesAutoresizingMaskIntoConstraints = false
        controllsStackView.distribution = .fillEqually
        controllsStackView.axis = .vertical
        controllsStackView.spacing = 15.0
        view.addSubview(controllsStackView)
        NSLayoutConstraint.activate([
            controllsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            controllsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            controllsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            controllsStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
    }
    
     @objc func newBoxesWindow(){
    //        print("new Window")
        self.navigationController?.pushViewController(NewBox(), animated: true)
            
        }
    @objc func pastBoxesWindow(){
//           print("new Window")
           self.navigationController?.pushViewController(PastBoxes(), animated: true)
               
           }
    @objc func profileWindow(){
       //        print("new Window")
           self.navigationController?.pushViewController(Profile(), animated: true)
               
           }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
