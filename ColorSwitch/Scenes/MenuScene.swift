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
        let playLabel = SKLabelNode(text: "Tap to Play")
        playLabel.fontName = "AvenirNext-Bold"
        playLabel.fontSize = 50.0
        playLabel.fontColor = UIColor.white
        playLabel.position = CGPoint(x: frame.midX, y:frame.midY)
        playLabel.zPosition = ZPositions.label
        addChild(playLabel)
        
        let highScoreLabel = SKLabelNode(text: "High Score")
        highScoreLabel.fontName = "AvenirNext-Bold"
        highScoreLabel.fontSize = 40.0
        highScoreLabel.fontColor = UIColor.white
        highScoreLabel.position = CGPoint(x: frame.midX, y:frame.midY - highScoreLabel.frame.size.height*4)
        highScoreLabel.zPosition = ZPositions.label
        addChild(highScoreLabel)
        
        let currentScoreLabel = SKLabelNode(text: "Recent Score")
        currentScoreLabel.fontName = "AvenirNext-Bold"
        currentScoreLabel.fontSize = 40.0
        currentScoreLabel.fontColor = UIColor.white
        currentScoreLabel.position = CGPoint(x: frame.midX, y:frame.midY - currentScoreLabel.frame.size.height*2)
        currentScoreLabel.zPosition = ZPositions.label
        addChild(currentScoreLabel)

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: view!.bounds.size)
        view?.presentScene(gameScene)
    }
}
