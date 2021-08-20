//
//  GameElements.swift
//  PushMe
//
//  Created by Pei Tsen Hsiao on 2019/11/12.
//  Copyright © 2019 Pei Tsen Hsiao. All rights reserved.
//

import SpriteKit

struct CollisionBitmask{
    static let Player:UInt32 = 0x00
    static let Obstacle:UInt32 = 0x01
    
}

enum ObstacleType:Int{
    case Small = 0
    case Medium = 1
    case Large = 2
}

enum RowType:Int{
    case oneS = 0
    case oneM = 1
    case oneL = 2
    case twoS = 3
    case twoM = 4
    case threeS = 5
}

extension GameScene{
    func addPlayer()
    {
        player = SKSpriteNode(color: UIColor.red, size: CGSize(width: 50, height: 50))
        player.position = CGPoint(x:  self.size.width / 2, y: 350)
        player.name = "PLAYER"
        player.physicsBody?.isDynamic = false
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.categoryBitMask = CollisionBitmask.Player
        player.physicsBody?.collisionBitMask = 0
        player.physicsBody?.contactTestBitMask = CollisionBitmask.Obstacle
        
        player2 = SKSpriteNode(color: UIColor.red, size: CGSize(width: 50, height: 50))
        player2.position = CGPoint(x:  self.size.width / 2, y: 350)
        player2.name = "PLAYER"
        player2.physicsBody?.isDynamic = false
        player2.physicsBody = SKPhysicsBody(rectangleOf: player2.size)
        player2.physicsBody?.categoryBitMask = CollisionBitmask.Player
        player2.physicsBody?.collisionBitMask = 0
        player2.physicsBody?.contactTestBitMask = CollisionBitmask.Obstacle
        
        addChild(player)
        addChild(player2)
        
        iniitialPlayerPosition = player.position
    }
    
}
