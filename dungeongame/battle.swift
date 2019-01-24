//
//  battle.swift
//  dungeongame
//
//  Created by 90303405 on 12/4/18.
//  Copyright © 2018 90303054. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class battle: SKScene{
    
    
    
    var updateLabel = SKLabelNode()
    var enemy = SKSpriteNode()
    var dude = SKSpriteNode()
    var attack1 = SKLabelNode()
    var attack2 = SKLabelNode()
    var attack3 = SKLabelNode()
    var attack4 = SKLabelNode()
    var attackbtn1 = SKSpriteNode()
    var attackbtn2 = SKSpriteNode()
    var attackbtn3 = SKSpriteNode()
    var attackbtn4 = SKSpriteNode()
    var dudeHealthbar = SKSpriteNode()
    var enemyHealthbar = SKSpriteNode()
    var updateLabel2 = SKLabelNode()
    var Diedlabel = SKLabelNode()
    var TextBox = SKSpriteNode()
    var isDead = false
    var isDudeDead = false
    
   override func didMove(to view: SKView) {
   
    updateLabel.fontColor = SKColor.white
    updateLabel2.fontColor = SKColor.white
    
    let ranNum = Int.random(in: 0..<dudeData.dudeVars.Dudedex.count)
    dudeData.enemyVars.currentEnemy = dudeData.dudeVars.Dudedex[ranNum]
    if dudeData.enemyVars.currentEnemy == "Grasster"{
        
        dudeData.enemyVars.currentEnemyAttack = dudeData.dudeVars.grassterAttack
        dudeData.enemyVars.currentEnemySpeed = dudeData.dudeVars.grassterSpeed
        dudeData.enemyVars.currentEnemyHealth = dudeData.dudeVars.grassterHealth
        dudeData.dudeMoves.currentEnemyMoves = dudeData.dudeMoves.grassterMoves
        dudeData.enemyVars.enemyHealthTotal = dudeData.dudeVars.grassterHealth
        
    } else if dudeData.enemyVars.currentEnemy == "Furtle"{
        
        dudeData.enemyVars.currentEnemyAttack = dudeData.dudeVars.furtleAttack
        dudeData.enemyVars.currentEnemySpeed = dudeData.dudeVars.furtleSpeed
        dudeData.enemyVars.currentEnemyHealth = dudeData.dudeVars.furtleHealth
        dudeData.dudeMoves.currentEnemyMoves = dudeData.dudeMoves.furtleMoves
        dudeData.enemyVars.enemyHealthTotal = dudeData.dudeVars.furtleHealth
        
    }else if dudeData.enemyVars.currentEnemy == "Sharkle"{
        
        dudeData.enemyVars.currentEnemyAttack = dudeData.dudeVars.sharkleAttack
        dudeData.enemyVars.currentEnemySpeed = dudeData.dudeVars.sharkleSpeed
        dudeData.enemyVars.currentEnemyHealth = dudeData.dudeVars.sharkleHealth
        dudeData.dudeMoves.currentEnemyMoves = dudeData.dudeMoves.sharkleMoves
        dudeData.enemyVars.enemyHealthTotal = dudeData.dudeVars.sharkleHealth
        
    }else if dudeData.enemyVars.currentEnemy == "Feaver"{
        
        dudeData.enemyVars.currentEnemyAttack = Double(dudeData.dudeVars.feaverAttack)
        dudeData.enemyVars.currentEnemySpeed = dudeData.dudeVars.sharkleSpeed
        dudeData.enemyVars.currentEnemyHealth = dudeData.dudeVars.feaverHealth
        dudeData.dudeMoves.currentEnemyMoves = dudeData.dudeMoves.feaverMoves
        dudeData.enemyVars.enemyHealthTotal = dudeData.dudeVars.feaverHealth
        
    }else if dudeData.enemyVars.currentEnemy == "Mr. Ghost"{
        
        dudeData.enemyVars.currentEnemyAttack = Double(dudeData.dudeVars.mrghostAttack)
        dudeData.enemyVars.currentEnemySpeed = dudeData.dudeVars.sharkleSpeed
        dudeData.enemyVars.currentEnemyHealth = dudeData.dudeVars.mrghostHealth
        dudeData.dudeMoves.currentEnemyMoves = dudeData.dudeMoves.mrghostMoves
        dudeData.enemyVars.enemyHealthTotal = dudeData.dudeVars.mrghostHealth
        
    }else if dudeData.enemyVars.currentEnemy == "Rabbice"{
        
        dudeData.enemyVars.currentEnemyAttack = Double(dudeData.dudeVars.rabbiceAttack)
        dudeData.enemyVars.currentEnemySpeed = dudeData.dudeVars.sharkleSpeed
        dudeData.enemyVars.currentEnemyHealth = dudeData.dudeVars.rabbiceHealth
        dudeData.dudeMoves.currentEnemyMoves = dudeData.dudeMoves.rabbiceMoves
        dudeData.enemyVars.enemyHealthTotal = dudeData.dudeVars.rabbiceHealth
        
    }else if dudeData.enemyVars.currentEnemy == "Leamoeba"{
        
        dudeData.enemyVars.currentEnemyAttack = Double(dudeData.dudeVars.leamoebaAttack)
        dudeData.enemyVars.currentEnemySpeed = dudeData.dudeVars.sharkleSpeed
        dudeData.enemyVars.currentEnemyHealth = dudeData.dudeVars.leamoebaHealth
        dudeData.dudeMoves.currentEnemyMoves = dudeData.dudeMoves.leamoebaMoves
        dudeData.enemyVars.enemyHealthTotal = dudeData.dudeVars.leamoebaHealth
        
    }
    updateLabel = self.childNode(withName: "updateLabel") as! SKLabelNode
    enemy = self.childNode(withName: "enemy") as! SKSpriteNode
    dude = self.childNode(withName: "dude") as! SKSpriteNode
    attack1 = self.childNode(withName: "Attack1") as! SKLabelNode
    attack2 = self.childNode(withName: "Attack2") as! SKLabelNode
    attack3 = self.childNode(withName: "Attack3") as! SKLabelNode
    attack4 = self.childNode(withName: "Attack4") as! SKLabelNode
    attackbtn1 = self.childNode(withName: "attackbtn1") as! SKSpriteNode
    attackbtn2 = self.childNode(withName: "attackbtn2") as! SKSpriteNode
    attackbtn3 = self.childNode(withName: "attackbtn3") as! SKSpriteNode
    attackbtn4 = self.childNode(withName: "attackbtn4") as! SKSpriteNode
    dudeHealthbar = self.childNode(withName: "DudeHealth") as! SKSpriteNode
    enemyHealthbar = self.childNode(withName: "EnemyHealth") as! SKSpriteNode
    dude.texture = SKTexture(imageNamed: "\(dudeData.dudeVars.currentDude)")
    enemy.texture = SKTexture(imageNamed: "\(dudeData.enemyVars.currentEnemy)")
    updateLabel2 = self.childNode(withName: "updateLabel2") as! SKLabelNode
    Diedlabel = self.childNode(withName: "Diedlabel") as! SKLabelNode
    TextBox = self.childNode(withName: "TextBox") as! SKSpriteNode
    
    if dudeData.dudeVars.currentDude == "Grasster"{
        
        attack1.text = "\(dudeData.dudeMoves.grassterMoves[0])"
        attack2.text = "\(dudeData.dudeMoves.grassterMoves[1])"
        attack3.text = "\(dudeData.dudeMoves.grassterMoves[2])"
        attack4.text = "\(dudeData.dudeMoves.grassterMoves[3])"
        dudeData.dudeVars.currentDudeAttack = dudeData.dudeVars.grassterAttack
        dudeData.dudeVars.currentDudeSpeed = dudeData.dudeVars.grassterSpeed
        
    }else if dudeData.dudeVars.currentDude == "Furtle"{
        
        attack1.text = "\(dudeData.dudeMoves.furtleMoves[0])"
        attack2.text = "\(dudeData.dudeMoves.furtleMoves[1])"
        attack3.text = "\(dudeData.dudeMoves.furtleMoves[2])"
        attack4.text = "\(dudeData.dudeMoves.furtleMoves[3])"
        dudeData.dudeVars.currentDudeAttack = dudeData.dudeVars.furtleAttack
        dudeData.dudeVars.currentDudeSpeed = dudeData.dudeVars.furtleSpeed
        
    }else{
        
        attack1.text = "\(dudeData.dudeMoves.sharkleMoves[0])"
        attack2.text = "\(dudeData.dudeMoves.sharkleMoves[1])"
        attack3.text = "\(dudeData.dudeMoves.sharkleMoves[2])"
        attack4.text = "\(dudeData.dudeMoves.sharkleMoves[3])"
        dudeData.dudeVars.currentDudeAttack = dudeData.dudeVars.sharkleAttack
        dudeData.dudeVars.currentDudeSpeed = dudeData.dudeVars.sharkleSpeed
        
    }
    
    updateLabel.text = ("\(dudeData.enemyVars.currentEnemy) wants to fight!")
    dudeHealthbar.size.width = CGFloat(240 * ((dudeData.dudeVars.currentDudeHealth)/(dudeData.dudeVars.dudeHealthTotal)))
    if dudeHealthbar.size.width <= 70{
        dudeHealthbar.color = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
    }else if dudeHealthbar.size.width <= 135{
        dudeHealthbar.color = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    }else{
        dudeHealthbar.color = #colorLiteral(red: 0.3882352941, green: 0.8549019608, blue: 0.2196078431, alpha: 1)
    }
    
    }
    
    func enemyAttackSelect() {
        
        let ranNum = Int.random(in: 0...3)
        if ranNum == 0{
            enemyAttack()
            updateLabel2.text = "Enemy \(dudeData.enemyVars.currentEnemy) used \(dudeData.dudeMoves.currentEnemyMoves[0])"
            
        }else if ranNum == 1{
            enemyAttack()
              updateLabel2.text = "Enemy \(dudeData.enemyVars.currentEnemy) used \(dudeData.dudeMoves.currentEnemyMoves[1])"
            
        }else if ranNum == 2{
            enemyAttack()
             updateLabel2.text = "Enemy \(dudeData.enemyVars.currentEnemy) used \(dudeData.dudeMoves.currentEnemyMoves[2])"
            
        }else if ranNum == 3{
            if dudeData.enemyVars.currentEnemyHealth >= dudeData.enemyVars.enemyHealthTotal{
                updateLabel2.text = ("Enemy \(dudeData.enemyVars.currentEnemy)'s health won't go higher")
            }else{
           let ranNum2 = Int.random(in: 0...9)
            if ranNum2 <= 5{
                dudeData.enemyVars.currentEnemyHealth += 20
                updateLabel2.text = "Enemy \(dudeData.enemyVars.currentEnemy) used \(dudeData.dudeMoves.currentEnemyMoves[3])"
                enemyHealthbar.size.width = CGFloat(240 * ((dudeData.enemyVars.currentEnemyHealth)/(dudeData.enemyVars.enemyHealthTotal)))
                if enemyHealthbar.size.width <= 70{
                    enemyHealthbar.color = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
                }else if enemyHealthbar.size.width <= 135{
                    enemyHealthbar.color = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
                }else{
                    enemyHealthbar.color = #colorLiteral(red: 0.3882352941, green: 0.8549019608, blue: 0.2196078431, alpha: 1)
                }
            }else{
                updateLabel2.text = "Enemy \(dudeData.enemyVars.currentEnemy) used \(dudeData.dudeMoves.currentEnemyMoves[3]) but it failed"
            }
            }
        }
        dudeHealthbar.size.width = CGFloat(240 * ((dudeData.dudeVars.currentDudeHealth)/(dudeData.dudeVars.dudeHealthTotal)))
        if dudeHealthbar.size.width <= 70{
            dudeHealthbar.color = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
        }else if dudeHealthbar.size.width <= 135{
            dudeHealthbar.color = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        }else{
            dudeHealthbar.color = #colorLiteral(red: 0.3882352941, green: 0.8549019608, blue: 0.2196078431, alpha: 1)
        }
    }
    
    func enemyAttack(){
    
        dudeData.dudeVars.currentDudeHealth = (dudeData.dudeVars.currentDudeHealth - dudeData.enemyVars.currentEnemyAttack)
        
        if dudeData.dudeVars.currentDudeHealth <= 0{
            Diedlabel.text = ("\(dudeData.dudeVars.currentDude) died!")
            Diedlabel.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            isDudeDead = true
            dude.texture = SKTexture(imageNamed: "dead")
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateLabel2.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        guard let touch = touches.first else {return}
        let touchlocation = touch.location(in: self)
        
        
            
            if TextBox.contains(touchlocation){
                if isDead == true {
                    
                
                let gameScene = GameScene(fileNamed:"GameScene")
                gameScene?.scaleMode = .aspectFill
                let reveal = SKTransition.fade(withDuration: 2)
                view!.presentScene(gameScene!, transition: reveal)
                    
                }else if isDudeDead == true{
                    let gameScene = GameScene(fileNamed:"Start")
                    gameScene?.scaleMode = .aspectFill
                    let reveal = SKTransition.fade(withDuration: 2)
                    view!.presentScene(gameScene!, transition: reveal)
                }
            }
            
        
        
        if attackbtn1.contains(touchlocation){
            
            if isDudeDead == false && isDead == false{
            updateLabel.text = "\(dudeData.dudeVars.currentDude) used \(dudeData.dudeMoves.currentMoves[0])"
            dudeData.enemyVars.currentEnemyHealth = (dudeData.enemyVars.currentEnemyHealth - dudeData.dudeVars.currentDudeAttack)
              enemyHealthbar.size.width = CGFloat(240 * ((dudeData.enemyVars.currentEnemyHealth)/(dudeData.enemyVars.enemyHealthTotal)))
            if enemyHealthbar.size.width <= 70{
                enemyHealthbar.color = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
            }else if enemyHealthbar.size.width <= 135{
                enemyHealthbar.color = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            }else{
                enemyHealthbar.color = #colorLiteral(red: 0.3882352941, green: 0.8549019608, blue: 0.2196078431, alpha: 1)
            }
            if dudeData.enemyVars.currentEnemyHealth <= 0 {
                Diedlabel.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                Diedlabel.text = ("Tap white box to continue")
                updateLabel2.text = ("\(dudeData.enemyVars.currentEnemy) died!")
                isDead = true
                enemy.texture = SKTexture(imageNamed: "dead")
                enemy.size.height = CGFloat(200)
                enemy.size.width = CGFloat(200)
                  dudeData.dudeVars.currentDudeHealth = dudeData.dudeVars.dudeHealthTotal
                 dudeHealthbar.size.width = CGFloat(240 * ((dudeData.dudeVars.currentDudeHealth)/(dudeData.dudeVars.dudeHealthTotal)))
                dudeHealthbar.color = #colorLiteral(red: 0.3882352941, green: 0.8549019608, blue: 0.2196078431, alpha: 1)
            }else{
                enemyAttackSelect()
            }
            }
        }
        
        if attackbtn2.contains(touchlocation){
            if isDudeDead == false && isDead == false{
            updateLabel.text = "\(dudeData.dudeVars.currentDude) used \(dudeData.dudeMoves.currentMoves[1])"
            dudeData.enemyVars.currentEnemyHealth = (dudeData.enemyVars.currentEnemyHealth - dudeData.dudeVars.currentDudeAttack)
              enemyHealthbar.size.width = CGFloat(240 * ((dudeData.enemyVars.currentEnemyHealth)/(dudeData.enemyVars.enemyHealthTotal)))
            if enemyHealthbar.size.width <= 70{
                enemyHealthbar.color = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
            }else if enemyHealthbar.size.width <= 135{
                enemyHealthbar.color = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            }else{
                enemyHealthbar.color = #colorLiteral(red: 0.3882352941, green: 0.8549019608, blue: 0.2196078431, alpha: 1)
            }
            if dudeData.enemyVars.currentEnemyHealth <= 0 {
                Diedlabel.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                Diedlabel.text = ("Tap white box to continue")
                updateLabel2.text = ("\(dudeData.enemyVars.currentEnemy) died!")
                isDead = true
                enemy.texture = SKTexture(imageNamed: "dead")
                enemy.size.height = CGFloat(200)
                enemy.size.width = CGFloat(200)
                  dudeData.dudeVars.currentDudeHealth = dudeData.dudeVars.dudeHealthTotal
                 dudeHealthbar.size.width = CGFloat(240 * ((dudeData.dudeVars.currentDudeHealth)/(dudeData.dudeVars.dudeHealthTotal)))
                dudeHealthbar.color = #colorLiteral(red: 0.3882352941, green: 0.8549019608, blue: 0.2196078431, alpha: 1)
            }else{
                enemyAttackSelect()
            }
            }
        }
        if attackbtn3.contains(touchlocation){
            if isDudeDead == false && isDead == false {
             updateLabel.text = "\(dudeData.dudeVars.currentDude) used \(dudeData.dudeMoves.currentMoves[2])"
            dudeData.enemyVars.currentEnemyHealth = (dudeData.enemyVars.currentEnemyHealth - dudeData.dudeVars.currentDudeAttack)
              enemyHealthbar.size.width = CGFloat(240 * ((dudeData.enemyVars.currentEnemyHealth)/(dudeData.enemyVars.enemyHealthTotal)))
            if enemyHealthbar.size.width <= 70{
                enemyHealthbar.color = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
            }else if enemyHealthbar.size.width <= 135{
                enemyHealthbar.color = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            }else{
                enemyHealthbar.color = #colorLiteral(red: 0.3882352941, green: 0.8549019608, blue: 0.2196078431, alpha: 1)
            }
            if dudeData.enemyVars.currentEnemyHealth <= 0 {
                Diedlabel.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                Diedlabel.text = ("Tap white box to continue")
                updateLabel2.text = ("\(dudeData.enemyVars.currentEnemy) died!")
                isDead = true
                enemy.texture = SKTexture(imageNamed: "dead")
                enemy.size.height = CGFloat(200)
                enemy.size.width = CGFloat(200)
                dudeData.dudeVars.currentDudeHealth = dudeData.dudeVars.dudeHealthTotal
                 dudeHealthbar.size.width = CGFloat(240 * ((dudeData.dudeVars.currentDudeHealth)/(dudeData.dudeVars.dudeHealthTotal)))
                dudeHealthbar.color = #colorLiteral(red: 0.3882352941, green: 0.8549019608, blue: 0.2196078431, alpha: 1)
            }else{
             enemyAttackSelect()
            }
            }
        }
        if attackbtn4.contains(touchlocation){
            if isDudeDead == false && isDead == false{
            if dudeData.dudeVars.currentDudeHealth >= dudeData.dudeVars.dudeHealthTotal{
                 updateLabel.text = "\(dudeData.dudeVars.currentDude)'s health won't go any higher"
                enemyAttackSelect()
            }else{
                let ranNum2 = Int.random(in: 0...9)
                if ranNum2 <= 5{
                 dudeData.dudeVars.currentDudeHealth += 20
                 updateLabel.text = "\(dudeData.dudeVars.currentDude) used \(dudeData.dudeMoves.currentMoves[3])"
                     dudeHealthbar.size.width = CGFloat(240 * ((dudeData.dudeVars.currentDudeHealth)/(dudeData.dudeVars.dudeHealthTotal)))
                    if dudeHealthbar.size.width <= 60{
                        dudeHealthbar.color = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                    }else if dudeHealthbar.size.width <= 135{
                        dudeHealthbar.color = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
                    }else{
                        dudeHealthbar.color = #colorLiteral(red: 0.3882352941, green: 0.8549019608, blue: 0.2196078431, alpha: 1)
                    }
                    if dudeData.enemyVars.currentEnemyHealth <= 0 {
                        Diedlabel.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                        Diedlabel.text = ("Tap white box to continue")
                        updateLabel2.text = ("\(dudeData.enemyVars.currentEnemy) died!")
                        isDead = true
                          dudeData.dudeVars.currentDudeHealth = dudeData.dudeVars.dudeHealthTotal
                         dudeHealthbar.size.width = CGFloat(240 * ((dudeData.dudeVars.currentDudeHealth)/(dudeData.dudeVars.dudeHealthTotal)))
                        dudeHealthbar.color = #colorLiteral(red: 0.3882352941, green: 0.8549019608, blue: 0.2196078431, alpha: 1)
                    }else{
                        enemyAttackSelect()
                    }
                }else{
                     updateLabel.text = "\(dudeData.dudeVars.currentDude) used \(dudeData.dudeMoves.currentMoves[3]) but it failed"
                    if dudeData.enemyVars.currentEnemyHealth <= 0 {
                        Diedlabel.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                        Diedlabel.text = ("Tap white box to continue")
                        updateLabel2.text = ("\(dudeData.enemyVars.currentEnemy) died!")
                        isDead = true
                    }else{
                        enemyAttackSelect()
                    }
                }
                }
            }
          
            
        }
        print ("\(dudeData.dudeVars.currentDudeHealth) currenthealth")
        print ("\(dudeData.dudeVars.currentDudeAttack) currentattack")
        print ("\(dudeData.dudeVars.dudeHealthTotal) healthtotal")
        print ("\(dudeData.enemyVars.currentEnemyHealth) currentenemyhealth")
        print ("\(dudeData.enemyVars.currentEnemyAttack) currentenemyattack")
        print ("\(dudeData.enemyVars.enemyHealthTotal) enemyhealthtotal")
        

    }
}
