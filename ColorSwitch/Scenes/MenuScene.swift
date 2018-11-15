//
//  MenuScene.swift
//  ColorSwitch
//
//  Created by BP Bista on 11/15/18.
//  Copyright © 2018 bpb.com.np. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        addLogo()
        addLabels()
    }
    func addLogo(){
        let logo = SKSpriteNode(imageNamed: "logo")
            logo.size = CGSize(width: frame.size.width/4, height: frame.size.width/4)
            logo.position = CGPoint(x: frame.midX, y: frame.midY + frame.size.height/4)
            logo.zPosition = ZPositions.colorSwitch
            addChild(logo)
    }
    func addLabels(){
        //create and add play label to menu scene
        let playLabel = SKLabelNode(text: "Tap to Play")
        playLabel.fontName = "AvenirNext-Bold"
        playLabel.fontSize = 50.0
        playLabel.fontColor = UIColor.white
        playLabel.position = CGPoint(x: frame.midX, y:frame.midY)
        playLabel.zPosition = ZPositions.label
        addChild(playLabel)
        
        //animate play label
        animateLabel(label: playLabel)
        
        //create and add high score label to menu scene
        let highScore = UserDefaults.standard.integer(forKey: "HighScore")
        let highScoreLabel = SKLabelNode(text: "HighScore: \(highScore)")
        highScoreLabel.fontName = "AvenirNext-Bold"
        highScoreLabel.fontSize = 40.0
        highScoreLabel.fontColor = UIColor.white
        highScoreLabel.position = CGPoint(x: frame.midX, y:frame.midY - highScoreLabel.frame.size.height*4)
        highScoreLabel.zPosition = ZPositions.label
        addChild(highScoreLabel)
        
        //create and add recent score label to menu scene
        let currentScoreLabel = SKLabelNode(text: "RecentScore: \(UserDefaults.standard.integer(forKey: "RecentScore"))")
        currentScoreLabel.fontName = "AvenirNext-Bold"
        currentScoreLabel.fontSize = 40.0
        currentScoreLabel.fontColor = UIColor.white
        currentScoreLabel.position = CGPoint(x: frame.midX, y:frame.midY - currentScoreLabel.frame.size.height*8)
        currentScoreLabel.zPosition = ZPositions.label
        addChild(currentScoreLabel)

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: view!.bounds.size)
        view?.presentScene(gameScene)
    }
    
    func animateLabel(label:SKLabelNode){
//        let fadout = SKAction.fadeOut(withDuration: 1)
//        let fadin = SKAction.fadeIn(withDuration: 1)
        
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.8)
        
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.8)
        
//        let sequence = SKAction.sequence([fadout,fadin])
        let sequence = SKAction.sequence([scaleUp,scaleDown])

        label.run(SKAction.repeatForever(sequence))
    }
}
