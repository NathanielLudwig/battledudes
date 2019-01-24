//
//  Start.swift
//  dungeongame
//
//  Created by 90303405 on 12/6/18.
//  Copyright © 2018 90303054. All rights reserved.
//

import Foundation


import SpriteKit
import GameplayKit


var dude1 = SKSpriteNode()
var dude2 = SKSpriteNode()
var dude3 = SKSpriteNode()


class Start: SKScene{

    
    override func didMove(to view: SKView) {
     dudeData.dudeVars.position = CGPoint(x: -622, y: -629)
     dude1 = self.childNode(withName: "Grasster") as! SKSpriteNode
     dude2 = self.childNode(withName: "Furtle") as! SKSpriteNode
     dude3 = self.childNode(withName: "Sharkle") as! SKSpriteNode
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let touchlocation = touch.location(in: self)
        
        if dude1.contains(touchlocation){
            
            dudeData.dudeVars.currentDudeAttack = dudeData.dudeVars.grassterAttack
            dudeData.dudeVars.currentDudeHealth = dudeData.dudeVars.grassterHealth
            dudeData.dudeVars.currentDudeSpeed = dudeData.dudeVars.grassterSpeed
            dudeData.dudeVars.dudeHealthTotal = dudeData.dudeVars.grassterHealth
            dudeData.dudeVars.currentDude = "Grasster"
            print (dudeData.dudeVars.currentDude)
            dudeData.dudeMoves.currentMoves = dudeData.dudeMoves.grassterMoves
            dudeData.dudeVars.currentDudeHealth = dudeData.dudeVars.grassterHealth
            let gameScene = GameScene(fileNamed:"GameScene")
            gameScene?.scaleMode = .aspectFill
            let reveal = SKTransition.fade(withDuration: 2)
            view!.presentScene(gameScene!, transition: reveal)
            
        }
        if dude2.contains(touchlocation){
            
            dudeData.dudeVars.currentDudeAttack = dudeData.dudeVars.furtleAttack
            dudeData.dudeVars.currentDudeHealth = dudeData.dudeVars.furtleHealth
            dudeData.dudeVars.currentDudeSpeed = dudeData.dudeVars.furtleSpeed
            dudeData.dudeVars.dudeHealthTotal = dudeData.dudeVars.furtleHealth
            dudeData.dudeVars.currentDude = "Furtle"
            print (dudeData.dudeVars.currentDude)
            dudeData.dudeMoves.currentMoves = dudeData.dudeMoves.furtleMoves
            dudeData.dudeVars.currentDudeHealth = dudeData.dudeVars.furtleHealth
            let gameScene = GameScene(fileNamed:"GameScene")
            gameScene?.scaleMode = .aspectFill
            let reveal = SKTransition.fade(withDuration: 2)
            view!.presentScene(gameScene!, transition: reveal)
            
        }
        if dude3.contains(touchlocation){
            
            dudeData.dudeVars.currentDudeAttack = dudeData.dudeVars.sharkleAttack
            dudeData.dudeVars.currentDudeHealth = dudeData.dudeVars.sharkleHealth
            dudeData.dudeVars.currentDudeSpeed = dudeData.dudeVars.sharkleSpeed
            dudeData.dudeVars.dudeHealthTotal = dudeData.dudeVars.sharkleHealth
            dudeData.dudeVars.currentDude = "Sharkle"
            print (dudeData.dudeVars.currentDude)
            dudeData.dudeMoves.currentMoves = dudeData.dudeMoves.sharkleMoves
            dudeData.dudeVars.currentDudeHealth = dudeData.dudeVars.sharkleHealth
            let gameScene = GameScene(fileNamed:"GameScene")
            gameScene?.scaleMode = .aspectFill
            let reveal = SKTransition.fade(withDuration: 2)
            view!.presentScene(gameScene!, transition: reveal)
            
        }
    }
    
}
