//
//  ViewController.swift
//  Brain Games
//
//  Created by Jose Arellanes on 12/7/19.
//  Copyright © 2019 Jose Arellanes. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {
    
    @IBOutlet weak var answerButton: UILabel!
    
    @IBOutlet weak var displayButton: UILabel!
    @IBOutlet weak var gameTitle: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    
    @IBOutlet weak var noButton: UIButton!
    
   
    // Gloabl variables
   var colors = ["red", "blue", "orange", "green", "purple"]
    var keyColors = ["red": UIColor.red, "blue": UIColor.blue, "orange": UIColor.orange, "green": UIColor.green, "purple": UIColor.purple]
    var points:Int = 0{
        didSet{
        scoreLabel.text = "Score \(points)"
        }
    }
    var timer:String = " Time: 2:00"
    
    
    var answerTitle:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }

    fileprivate func changeColor(){
             let answerColorChoice = colors[Int.random(in: 0..<colors.count)]
             let displayColorChoice = colors[Int.random(in: 0..<colors.count)]
                 let displayColorChoiceUI = colors[Int.random(in: 0..<colors.count)]
                 answerButton.text = answerColorChoice
                 displayButton.textColor = keyColors[displayColorChoiceUI]
                 displayButton.text = displayColorChoice
       }
    
    
    fileprivate func setupViews() {
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Boom.jpg")!)
        answerButton!.backgroundColor = UIColor.black
        displayButton!.backgroundColor = UIColor.black
        yesButton!.backgroundColor = UIColor.black
        noButton!.backgroundColor = UIColor.black
        scoreLabel.text = "Score: \(points)"
        timeLabel.text = timer
        changeColor()
        buttonAnswer()
       }
    
   
    
    fileprivate func buttonAnswer(){
        yesButton!.setTitle("YES", for: .normal)
        noButton!.setTitle("No", for: .normal)
    }
    @IBAction func yesButtonTrigger(_ sender: Any) {
        let textColor = keyColors[answerButton.text!]  // Gives a UI color
        if textColor == displayButton.textColor{
            points += 1
            changeColor()
        }
        else{
            changeColor()
            print("Wrong")
        }
        
    }
    
    @IBAction func noButtonTrigger(_ sender: Any) {
        let textColor = keyColors[answerButton.text!]  // Gives a UI color
               if textColor == displayButton.textColor{
                   points += 1
                   changeColor()
               }
               else{
                   changeColor()
                   print("Wrong")
               }
    }
}

