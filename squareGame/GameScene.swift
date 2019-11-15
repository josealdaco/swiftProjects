//
//  GameScene.swift
//  Game-Starter-Empty
//
//  Created by mitchell hudson on 9/13/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var points:Int = 0 // Total points
    let square = SKSpriteNode(color: UIColor.purple, size: CGSize(width:64, height: 64))
    let square_2 = SKSpriteNode(color: UIColor.purple, size: CGSize(width:64, height: 64))
    let square_3 = SKSpriteNode(color: UIColor.purple, size: CGSize(width:64, height: 64))
    var currentScore: SKLabelNode!
  
    
    
    override func didMove(to view: SKView) {
        
       
        square.name = "square"  // name the nodes
        square_2.name = "squareTwo"
        square_3.name = "squareThree"
        
        
        
        //let square_2 = SKSpriteNode(color: UIColor.purple, size: CGSize(width:64, height: 64))
        //let square_3 = SKSpriteNode(color: UIColor.purple, size: CGSize(width: 64, height: 64))
        square.position = CGPoint(x: 10, y: (self.scene?.frame.size.height)! + 10)
        square_2.position = CGPoint(x:(self.scene?.frame.size.width)!/2, y: (self.scene?.frame.size.height)! + 10)
        square_3.position = CGPoint(x:(self.scene?.frame.size.width)!, y: (self.scene?.frame.size.height)! + 10)
        currentScore = SKLabelNode(fontNamed: "Helvetica")
        currentScore.text = "Score: \(points)"
        currentScore.horizontalAlignmentMode = .left
        currentScore.position = CGPoint(x: (self.scene?.frame.size.width)!/2 - 60, y: (self.scene?.frame.size.height)!-50)
         // square_2.position = CGPoint(x:(self.scene?.frame.size.width)!/2, y: 0)
        //square_3.position = CGPoint(x:(self.scene?.frame.size.width)!/2, y: 0)
        // Called when the scene has been displayed
        if let scene = self.scene{
            scene.addChild(currentScore)
            scene.addChild(square)
            scene.addChild(square_2)
            scene.addChild(square_3)
            //scene.addChild(square_2)
            //scene.addChild(square_3)
        }
        
        /*************************
        Compare postions to enable adding a square
            ******************/

        
        let moveDown = SKAction.moveBy(x:0, y: -(self.scene?.frame.size.height)! + 10, duration: 2.5)
        let repeatMoveDown = SKAction.repeatForever(moveDown)
        square.run(repeatMoveDown)
        square_2.run(repeatMoveDown)
        square_3.run(repeatMoveDown)
        /*****
        /// Square One
        let moveUp = SKAction.moveBy(x:0, y: 50, duration: 0.5)
        let moveRight = SKAction.moveBy(x:50, y: 0, duration: 0.5)
         moveDown = SKAction.moveBy(x:0, y: -50, duration: 0.5)
        let moveLeft = SKAction.moveBy(x:-50, y:0, duration: 0.5)
        let circle = SKAction.sequence([moveUp,moveRight,moveDown,moveLeft])
        let repeatAction = SKAction.repeatForever(circle)
        square.run(repeatAction)
        
        /// Square Two
        let fadeIn = SKAction.fadeIn(withDuration: 0.5)
        let expand = SKAction.scale(to: 1.0, duration: 0.5)
        let shrink = SKAction.scale(to: 0.0, duration: 0.5)
        let faceOut = SKAction.fadeOut(withDuration: 0.5)
        
        let grow = SKAction.group([fadeIn, expand])
        let beGone = SKAction.group([shrink, faceOut])
        let repeatActionSquareTwo = SKAction.sequence([beGone, grow])
        let fadeSquare = SKAction.repeatForever(repeatActionSquareTwo)
        square_2.run(fadeSquare)
        
        /// SQUARE Three
        let increase = SKAction.moveBy(x: 0, y: (self.scene?.frame.size.height)!, duration: 3)
        let fadeIn2 = SKAction.fadeIn(withDuration: 4)
        let expand2 = SKAction.scale(to: 1, duration: 3)
        let grow2 = SKAction.group([fadeIn2, expand2])
        let popOut = SKAction.group([increase, grow2])
        let shrink2 = SKAction.scale(to: 0.0, duration: 0.1)
        let runpopOut = SKAction.sequence([popOut])
        square_3.alpha = 1.0
        square_3.setScale(0)
        square_3.run(runpopOut)
    *****/
     
    }
   
   
    func addSquare(_ name:String){
        let square = SKSpriteNode(color: UIColor.purple, size: CGSize(width:64, height: 64))
        square.name = name
        let position = Int.random(in:0...3)  // 0 is left, 1 is center and 3 is right
        if position == 0{
        square.position = CGPoint(x: 10, y: (self.scene?.frame.size.height)! - 10)  // left
        }else if(position == 1){
        square.position = CGPoint(x:(self.scene?.frame.size.width)!/2, y: (self.scene?.frame.size.height)! + 10) // center
        }
        else{
        square.position = CGPoint(x:(self.scene?.frame.size.width)!, y: (self.scene?.frame.size.height)! - 10) // right
        }
        scene?.addChild(square)
        let moveDown = SKAction.moveBy(x:0, y: -(self.scene?.frame.size.height)! - 10, duration: 2.5)
        let repeatMoveDown = SKAction.repeatForever(moveDown)
        square.run(repeatMoveDown)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            let node = self.atPoint(touchLocation)
            if node.name != nil {
                points += 1
                print("not miss")
                self.currentScore.text = "Score: \(points)"
                node.removeFromParent()
            }else{
                print("miss")
            }
        }
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        var result = false
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            print("FIRE!!!")
            result = true
        })
        switch(result){
        case true: timer.invalidate()
        case false:
            break
        }
    }

}

