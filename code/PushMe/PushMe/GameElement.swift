//
//  GameElement.swift
//  PushMe
//
//  Created by Pei Tsen Hsiao on 2019/11/12.
//  Copyright © 2019 Pei Tsen Hsiao. All rights reserved.
//

import SpriteKit

struct CollisionBitmask{
    static let Player:UInt32 = 0x00
    static let Obstacle:UInt32 = 0x01
    static let Bound:UInt32 = 0x02
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
        player.position = CGPoint(x: self.size.width * 0.5, y: 350)
        player.name = "PLAYER"
        player.physicsBody?.isDynamic = false
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.categoryBitMask = CollisionBitmask.Player
        player.physicsBody?.collisionBitMask = 0
        player.physicsBody?.contactTestBitMask = CollisionBitmask.Obstacle
        
        player2 = SKSpriteNode(color: UIColor.red, size: CGSize(width: 50, height: 50))
        player2.position = CGPoint(x: self.size.width * 0.5, y: 350)
        player2.name = "PLAYER"
        player2.physicsBody?.isDynamic = false
        player2.physicsBody = SKPhysicsBody(rectangleOf: player2.size)
        player2.physicsBody?.categoryBitMask = CollisionBitmask.Player
        player2.physicsBody?.collisionBitMask = 0
        player2.physicsBody?.contactTestBitMask = CollisionBitmask.Obstacle
        
        addChild(player)
        addChild(player2)
        
        initialPlayerPosition = player.position
    }
    
    func addObstacle (type:ObstacleType) -> SKSpriteNode{
        let obstacle = SKSpriteNode(color: UIColor.white, size: CGSize(width: 0, height: 30))
        obstacle.name = "OBSTACLE"
        obstacle.physicsBody?.isDynamic = true
        
        switch type {
        case .Small:
            obstacle.size.width = self.size.width * 0.2
            break
        case .Medium:
            obstacle.size.width = self.size.width * 0.35
            break
        case .Large:
            obstacle.size.width = self.size.width * 0.75
            break
        }
        obstacle.position = CGPoint(x: 0, y: self.size.height + obstacle.size.height)
        obstacle.physicsBody = SKPhysicsBody(rectangleOf: obstacle.size)
        obstacle.physicsBody?.categoryBitMask = CollisionBitmask.Obstacle
        obstacle.physicsBody?.collisionBitMask = 0
        return obstacle
    }
    
    func boundary(){
        bound = SKSpriteNode(color: UIColor.red, size: CGSize(width: self.size.width*2 , height: 10))
        bound.position = CGPoint(x: 0, y: 250)
        bound.name = "BOUND"
        bound.physicsBody = SKPhysicsBody(rectangleOf: bound.size)
        bound.physicsBody?.categoryBitMask = CollisionBitmask.Bound
        bound.physicsBody?.collisionBitMask = 0
        bound.physicsBody?.contactTestBitMask = CollisionBitmask.Obstacle
        
        addChild(bound)
    }
    
    func addMovement (obstacle:SKSpriteNode){
        var actionArray = [SKAction]()
        
        actionArray.append(SKAction.move(to: CGPoint(x: obstacle.position.x, y: -obstacle.size.height), duration: TimeInterval(3)))
        actionArray.append(SKAction.removeFromParent())
        
        obstacle.run(SKAction.sequence(actionArray))
        
    }
    
    func addRow (type:RowType){
        switch type{
        case .oneS:
            let obst = addObstacle(type: .Small)
            obst.position = CGPoint(x: self.size.width*0.5, y: obst.position.y)
            addMovement(obstacle: obst)
            addChild(obst)
            break
        case .oneM:
            let obst = addObstacle(type: .Medium)
            obst.position = CGPoint(x: self.size.width*0.5, y: obst.position.y)
            addMovement(obstacle: obst)
            addChild(obst)
            break
        case .oneL:
            let obst = addObstacle(type: .Large)
            obst.position = CGPoint(x: self.size.width*0.5, y: obst.position.y)
            addMovement(obstacle: obst)
            addChild(obst)
            break
        case .twoS:
            let obst1 = addObstacle(type: .Small)
            let obst2 = addObstacle(type: .Small)
            
            obst1.position = CGPoint(x: obst1.size.width + 50, y: obst1.position.y)
            obst2.position = CGPoint(x: self.size.width - obst2.size.width - 50, y: obst1.position.y)
            
            addMovement(obstacle: obst1)
            addMovement(obstacle: obst2)
            
            addChild(obst1)
            addChild(obst2)
            break
        case .twoM:
            let obst1 = addObstacle(type: .Medium)
            let obst2 = addObstacle(type: .Medium)
            
            obst1.position = CGPoint(x: obst1.size.width / 2 + 50, y: obst1.position.y)
            obst2.position = CGPoint(x: self.size.width - obst2.size.width / 2-50, y: obst1.position.y)
            
            addMovement(obstacle: obst1)
            addMovement(obstacle: obst2)
            
            addChild(obst1)
            addChild(obst2)
            break
        case .threeS:
            let obst1 = addObstacle(type: .Small)
            let obst2 = addObstacle(type: .Small)
            let obst3 = addObstacle(type: .Small)

            obst1.position = CGPoint(x: obst1.size.width / 2 + 50, y: obst1.position.y)
            obst2.position = CGPoint(x: self.size.width - obst2.size.width / 2 - 50, y: obst1.position.y)
            obst3.position = CGPoint(x: self.size.width / 2, y: obst1.position.y)

            addMovement(obstacle: obst1)
            addMovement(obstacle: obst2)
            addMovement(obstacle: obst3)

            addChild(obst1)
            addChild(obst2)
            addChild(obst3)
            break
        }
       
    }
    
    
           
  
}

