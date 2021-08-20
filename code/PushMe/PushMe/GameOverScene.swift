//
//  GameOverScene.swift
//  PushMe
//
//  Created by Pei Tsen Hsiao on 2019/11/16.
//  Copyright © 2019 Pei Tsen Hsiao. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.backgroundColor = SKColor.black
        let message = "GAME OVER"
        
        let label = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        label.text = message
        label.fontColor = SKColor.white
        label.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        label.fontSize = 100
        
         addChild(label)
        
       /* var highScore = 0

        let highScoreLabel = SKLabelNode(fontNamed: "Arial")
        highScoreLabel.position = CGPoint(x: self.frame.width - 80, y: self.frame.height - 22)
        if highScore < score {
             highScore = score
             highScoreLabel.text = "Highest Score: \(highScore)"
         } else {
             highScoreLabel.text = "Highest Score: 0"
         }
         highScoreLabel.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 - self.frame.height / 7)
         highScoreLabel.zPosition = 5
         highScoreLabel.fontSize = 60
         
         
         addChild(highScoreLabel)*/
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = SKTransition.fade(withDuration: 0.5)
        let gameScene = GameScene(size: self.size)
        self.view?.presentScene(gameScene, transition: transition)
    }

}
