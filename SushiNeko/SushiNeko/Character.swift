//
//  Character.swift
//  SushiNeko
//
//  Created by Jose Arellanes on 11/14/19.
//  Copyright © 2019 Jose Arellanes. All rights reserved.
//

import SpriteKit

class Character: SKSpriteNode {
    let punch = SKAction(named: "Punch")!

    /* Character side */
    var side: Side = .left {
        didSet {
            if side == .left {
                print("left")
                xScale = 0.5
                position.x = 70
            } else {
                /* An easy way to flip an asset horizontally is to invert the X-axis scale */
                print("right")
                xScale = -0.5
                position.x = 252
            }
             /* Run the punch action */ run(punch)
        }
        
       
    }

    /* You are required to implement this for your subclass to work */
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }

    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
