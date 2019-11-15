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
    let square = SKSpriteNode(color: UIColor.purple, size: CGSize(width:100, height: 100))
    let square_2 = SKSpriteNode(color: UIColor.purple, size: CGSize(width:100, height: 100))
    let square_3 = SKSpriteNode(color: UIColor.purple, size: CGSize(width:100, height: 100))
    var currentScore: SKLabelNode!
  
    
    
    override func didMove(to view: SKView) {
        
       
        square.name = "square"  // name the nodes
        square_2.name = "squareTwo"
        square_3.name = "squareThree"
        
        square.position = CGPoint(x: 100, y:( self.scene?.frame.size.height)! - 10)
        square_2.position = CGPoint(x:(self.scene?.frame.size.width)!/2, y:( self.scene?.frame.size.height)! - 10)
        square_3.position = CGPoint(x:(self.scene?.frame.size.width)! - 100, y:( self.scene?.frame.size.height)! - 10)
        currentScore = SKLabelNode(fontNamed: "Helvetica")
        currentScore.text = "Score: \(points)"
        currentScore.horizontalAlignmentMode = .left
        currentScore.position.x = (self.scene?.frame.size.width)! - 200
        currentScore.position.y = (self.scene?.frame.size.height)! - 50
    
        if let scene = self.scene{
            scene.addChild(currentScore)
            scene.addChild(square)
            scene.addChild(square_2)
            scene.addChild(square_3)
        }
        


        
        let moveDown = SKAction.moveBy(x:0, y: -(self.scene?.frame.size.height)! + 10, duration: 2.5)
        let repeatMoveDown = SKAction.repeatForever(moveDown)
        square.run(repeatMoveDown)
        square_2.run(repeatMoveDown)
        square_3.run(repeatMoveDown)
    }
   
   
    func addSquare(_ name:String){
        let square = SKSpriteNode(color: UIColor.purple, size: CGSize(width:100, height: 100))
        square.name = name
        let position = Int.random(in:0...3)  // 0 is left, 1 is center and 3 is right
        if position == 0{
        square.position = CGPoint(x: 100, y:( self.scene?.frame.size.height)! - 10)  // left
        }else if(position == 1){
            square.position = CGPoint(x:100, y:( self.scene?.frame.size.height)! - 10) // center
        }
        else{
        square.position = CGPoint(x:200, y:( self.scene?.frame.size.height)! - 10) // right
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
                addSquare("square")
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
