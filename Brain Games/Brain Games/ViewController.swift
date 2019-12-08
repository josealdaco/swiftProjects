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
    
    @IBOutlet weak var restartButton: UIButton!
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
    var timer:Double = 60.0{
        didSet{
            timeLabel.text = "Time:\(timer)s"
        }
    }
    
    var paused:Bool = false{
        didSet{
            if paused == true{
            pauseButton.setTitle("unPause", for: .normal)
            }
            else{
                pauseButton.setTitle("Pause", for: .normal)
            }
        }
    }
    
    
    var answerTitle:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func timeFunction(){
        /*  Timer function here*/
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timerCheck in
            if self.timer == 0.0 || self.paused == true{
                timerCheck.invalidate() // Stop Timer
                self.restart() // disables all buttons if paused or time is out
            }
             self.timer = self.timer - 1.0
        })
    }
    
    fileprivate func restart(){
        /* Will activate if timer has been resetted to 0*/

            restartButton.isEnabled = true
            restartButton.isHidden = false
            yesButton.isEnabled = false
            noButton.isEnabled = false
            pauseButton.isEnabled = false
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
        restartButton.isEnabled = false
        restartButton.isHidden = true
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Boom.jpg")!)
        answerButton!.backgroundColor = UIColor.black
        displayButton!.backgroundColor = UIColor.black
        yesButton!.backgroundColor = UIColor.black
        noButton!.backgroundColor = UIColor.black
        scoreLabel.text = "Score: \(points)"
        timeLabel.text = "Time:\(timer)"
        pauseButton.setTitle("Pause", for: .normal)
        changeColor()
        buttonAnswer()
        timeFunction()
       }
    
   
    
    fileprivate func buttonAnswer(){
        yesButton!.setTitle("YES", for: .normal)
        noButton!.setTitle("No", for: .normal)
    }
    @IBAction func yesButtonTrigger(_ sender: Any) {
        let textColor = keyColors[answerButton.text!]  // Gives a UI color
        if textColor == displayButton.textColor{
            points += 10
            changeColor()
        }
        else{
            changeColor()
            if points != 0{
            points -= 10
            }
        }
        
    }
    
    @IBAction func noButtonTrigger(_ sender: Any) {
        let textColor = keyColors[answerButton.text!]  // Gives a UI color
               if textColor != displayButton.textColor{
                   points += 10
                   changeColor()
               }
               else{
                   changeColor()
                if points != 0{
                   points -= 10
                }
               }
    }
    
    
    @IBAction func pauseButtonTrigger(_ sender: Any) {
        if pauseButton.currentTitle! == "Pause"{
            paused = true
        }
        else{
            paused = false
            timeFunction()
        }
    }
    
    
    @IBAction func restartButtonTrigger(_ sender: Any) {
        
    }
    
}

