//
//  GameScene.swift
//  ColorSwitch
//
//  Created by BP Bista on 11/14/18.
//  Copyright © 2018 bpb.com.np. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var colorSwitch:SKSpriteNode!
    var switchState = SwitchState.blue
    var currentColorIndex:Int?
    let scoreLabel = SKLabelNode(text: "0")
    var score = 0

    override func didMove(to view: SKView) {
        setPhyics()
        layoutScene()
    }
    
    func setPhyics() {
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -1.0)
        physicsWorld.contactDelegate = self
    }
    
    func layoutScene(){
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        
        scoreLabel.fontName = "AvenirNext-Bold"
        scoreLabel.fontSize = 60.0
        scoreLabel.fontColor = UIColor.white
        scoreLabel.position = CGPoint(x: frame.midX, y:frame.midY)
        scoreLabel.zPosition = ZPositions.label
        addChild(scoreLabel)
        
        colorSwitch = SKSpriteNode(imageNamed: "colorSwitch")
        colorSwitch.size = CGSize(width: frame.size.width/3, height: frame.size.width/3)
        colorSwitch.position = CGPoint(x: frame.midX, y: frame.minY + colorSwitch.size.height)
        colorSwitch.zPosition = ZPositions.colorSwitch
        //add phyics
        colorSwitch.physicsBody = SKPhysicsBody(circleOfRadius: colorSwitch.size.width/2)
        colorSwitch.physicsBody?.categoryBitMask = PhyicsCategories.switchCategory
        colorSwitch.physicsBody?.contactTestBitMask =  PhyicsCategories.ballCategory
        //keep stationary
        colorSwitch.physicsBody?.isDynamic = false
        addChild(colorSwitch)

        spawnBall()
    }
    func updateScoreLabel(){
        scoreLabel.text = "\(score)"
    }
    func spawnBall(){
        currentColorIndex = Int(arc4random_uniform(UInt32(3)))
//        let ball =  SKSpriteNode(imageNamed: "ball")
        let ball =  SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color:PlayColors.colors[currentColorIndex!], size: CGSize(width: 30.0, height: 30.0))
        ball.colorBlendFactor = 1.0
        ball.name = "Ball"
        ball.position = CGPoint(x: frame.midX, y: frame.maxY)
        ball.zPosition = ZPositions.ball
        //phyics body
        ball.physicsBody = SKPhysicsBody(circleOfRadius: frame.size.width/2)
        ball.physicsBody?.categoryBitMask = PhyicsCategories.ballCategory
        ball.physicsBody?.contactTestBitMask =  PhyicsCategories.switchCategory
        ball.physicsBody?.collisionBitMask =  PhyicsCategories.none
        
        addChild(ball)
    }
    
    func turn(){
        if let newState = SwitchState(rawValue: switchState.rawValue+1){
            switchState = newState
        }else{
            switchState = .red
        }
        colorSwitch.run(SKAction.rotate(byAngle: .pi/1.5, duration: 0.25))
    }
    func gameOver(){
        UserDefaults.standard.set(score, forKey: "RecentScore")
        if score > UserDefaults.standard.integer(forKey: "HighScore"){
            UserDefaults.standard.set(score, forKey: "HighScore")
        }
        let menuScene = MenuScene(size:view!.bounds.size)
        view?.presentScene(menuScene)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        turn()
    }
}

extension GameScene:SKPhysicsContactDelegate{
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if(contactMask == PhyicsCategories.ballCategory | PhyicsCategories.switchCategory){
            if let ball = contact.bodyA.node?.name == "Ball" ? contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as? SKSpriteNode{
                if currentColorIndex == switchState.rawValue{
                    score += 1
                    updateScoreLabel()
                    ball.run(SKAction.fadeOut(withDuration: 0.25)) {
                        ball.removeFromParent()
                        self.spawnBall()
                    }
                }else{
                    gameOver()
                }
            }
        }
    }
}
