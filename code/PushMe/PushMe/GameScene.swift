//
//  GameScene.swift
//  PushMe
//
//  Created by Pei Tsen Hsiao on 2019/11/12.
//  Copyright © 2019 Pei Tsen Hsiao. All rights reserved.
//
import UIKit
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player:SKSpriteNode!
    var player2:SKSpriteNode!
    var initialPlayerPosition:CGPoint!
    var scoreLabel:SKLabelNode!
    var highScoreLabel:SKLabelNode!
    var score = 0
    
    var bound:SKSpriteNode!

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let maximumPossibleForce = touch.maximumPossibleForce
            let force = touch.force
            let normalizedForce = force / maximumPossibleForce
            
            player.position.x = (self.size.width / 2) - normalizedForce * (self.size.width / 2 - 25)
            player2.position.x = (self.size.width / 2) + normalizedForce * (self.size.width / 2 - 25)

        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        resetPayerPosition()
    }
    
    func resetPayerPosition() {
        player.position = initialPlayerPosition
        player2.position = initialPlayerPosition
        
    }
   

    
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        addPlayer()
        //addRow(type: RowType.twoS)
        //boundary()
        //createScoreLabel()
    }
    
    func addRandomRow (){
        let randomNumber = Int(arc4random_uniform(6))
        
        switch randomNumber {
        case 0:
            addRow(type: RowType(rawValue: 0)!)
            break
        case 1:
            addRow(type: RowType(rawValue: 1)!)
            break
        case 2:
            addRow(type: RowType(rawValue: 2)!)
            break
        case 3:
            addRow(type: RowType(rawValue: 3)!)
            break
        case 4:
            addRow(type: RowType(rawValue: 4)!)
            break
        case 5:
            addRow(type: RowType(rawValue: 5)!)
            break
        default:
            break
        }
    }
   
    var lastUpdateTimeInterval = TimeInterval()
    var lastYieldTimeInterval = TimeInterval()
    
    func updateWithTimeSinceLastUpdate (timeSinceLastUpdate: CFTimeInterval){
        lastYieldTimeInterval += timeSinceLastUpdate
        if lastYieldTimeInterval > 0.7{
            lastYieldTimeInterval = 0
            addRandomRow()
        }
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        var timeSinceLastUpdate = currentTime - lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime
        
        if timeSinceLastUpdate > 1{
            timeSinceLastUpdate = 1/60
            lastUpdateTimeInterval = currentTime
        }
        
        updateWithTimeSinceLastUpdate(timeSinceLastUpdate: timeSinceLastUpdate)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "PLAYER"{
            //print("GAME_ OVER_")
            showGameOver()
        }
        if contact.bodyA.node?.name == "BOUND"{
            score += 5
            print(score)
        }
    }
    
    /*func createScoreLabel() {
           scoreLabel = SKLabelNode(fontNamed: "Arial")
           scoreLabel.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + self.frame.height / 2.6)
           scoreLabel.text = "\(score)"
           scoreLabel.zPosition = 5
           scoreLabel.fontSize = 50
           addChild(scoreLabel)
    }*/
    
    
    
    func showGameOver (){
        let transition = SKTransition.fade(withDuration: 0.5)
        let gameOverScene = GameOverScene(size: self.size)
        self.view?.presentScene(gameOverScene, transition: transition)
    }
    
    
}

  
