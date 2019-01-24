//
//  GameScene.swift
//  dungeongame
//
//  Created by 90303054 on 11/12/18.
//  Copyright © 2018 90303054. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate{
    
    var dude = SKSpriteNode()
    var upbutton = SKSpriteNode()
    var leftbutton = SKSpriteNode()
    var rightbutton = SKSpriteNode()
    var downbutton = SKSpriteNode()
    var dudeVert = 0
    var dudeHorz = 0
    var upanimation: [SKTexture] = []
    var downanimation: [SKTexture] = []
    var leftanimation: [SKTexture] = []
    var rightanimation: [SKTexture] = []
    let runningkey = "action_running"
    var levelmap:SKTileMapNode = SKTileMapNode()
    var tile = SKTileDefinition()
    var tilearray: [SKSpriteNode] = []

    override func didMove(to view: SKView) {
        upbutton = camera?.childNode(withName: "up") as! SKSpriteNode
        dude = self.childNode(withName: "dude") as! SKSpriteNode
        leftbutton = camera?.childNode(withName: "left") as! SKSpriteNode
        rightbutton = camera?.childNode(withName: "right") as! SKSpriteNode
        downbutton = camera?.childNode(withName: "down") as! SKSpriteNode
        
        
       
        
        dude.position = dudeData.dudeVars.position
       
        for i in 0..<3 {
            upanimation.append(SKTexture(imageNamed: "up_\(i)"))
            downanimation.append(SKTexture(imageNamed: "down_\(i)"))
            rightanimation.append(SKTexture(imageNamed: "right_\(i)"))
            leftanimation.append(SKTexture(imageNamed: "left_\(i)"))
        }
        for node in self.children {
            if node.name == "map" {
                levelmap = node as! SKTileMapNode
            }
            
        }
        givePhysicsBody(map: levelmap)
        
        
       
    }
    
   
    func handletouches(touches: Set<UITouch>){
        guard let touch = touches.first else {return}
        let touchlocation = touch.location(in: camera!)
        
        if upbutton.contains(touchlocation) {
            
            dudeVert = 1
            dude.run(SKAction.repeatForever(
                SKAction.animate(with: upanimation,
                                 timePerFrame: 0.1,
                                 resize: false,
                                 restore: false)), withKey: runningkey)
        }
        if downbutton.contains(touchlocation){
            dudeVert = -1
            dude.run(SKAction.repeatForever(
                SKAction.animate(with: downanimation,
                                 timePerFrame: 0.1,
                                 resize: false,
                                 restore: false)), withKey: runningkey)
     }
        if rightbutton.contains(touchlocation){
            dudeHorz = 1
            
            dude.run(SKAction.repeatForever(
                SKAction.animate(with: rightanimation,
                                 timePerFrame: 0.1,
                                 resize: false,
                                 restore: false)))
            

            
        
        }
        if leftbutton.contains(touchlocation){
            dudeHorz = -1
            dude.run(SKAction.repeatForever(
                SKAction.animate(with: leftanimation,
                                 timePerFrame: 0.1,
                                 resize: false,
                                 restore: false)))
             
            
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        handletouches(touches: touches)
       
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //handletouches(touches: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //handletouches(touches: touches)
        let touchlocation = touches.first?.location(in: camera!)
        if upbutton.contains(touchlocation!) || leftbutton.contains(touchlocation!) || rightbutton.contains(touchlocation!) || downbutton.contains(touchlocation!) {
        dudeVert = 0
        dudeHorz = 0
        removeAllActions()
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if dudeHorz == 0 && dudeVert == 0 {
            dude.removeAllActions()
        }

        dude.position.y += CGFloat(dudeVert)
        dude.position.x += CGFloat(dudeHorz)
        camera?.position = dude.position
        if dudeHorz != 0 || dudeVert != 0 {
        for tile in tilearray{
           
            if tile.contains(dude.position){
                let random = Int.random(in: 0 ..< 300)
                if random <= 1{
                    dudeData.dudeVars.position = dude.position
                    let gameScene = GameScene(fileNamed:"battle")
                    gameScene?.scaleMode = .aspectFit
                    let reveal = SKTransition.fade(withDuration: 2)
                    view!.presentScene(gameScene!, transition: reveal)

                }
            }
        }
        }
    }
    
    
    
    
    func givePhysicsBody(map: SKTileMapNode){
        let map = map
        
        let halfheight = CGFloat(map.numberOfRows) / 2.0 * map.tileSize.height
        let halfwidth = CGFloat(map.numberOfColumns) / 2.0 * map.tileSize.width
        for col in 0 ..< map.numberOfColumns {
            for row in 0..<map.numberOfRows {
                
                let tiledefintion = map.tileDefinition(atColumn: col, row: row)
                let leftdefintion = map.tileDefinition(atColumn: col - 1, row: row)
                let rightdefintion = map.tileDefinition(atColumn: col + 1, row: row)
                let updefintion = map.tileDefinition(atColumn: col, row: row - 1)
                let downdefintion = map.tileDefinition(atColumn: col, row: row + 1)
                
                tile = tiledefintion!
                let x = CGFloat(col) * map.tileSize.width - halfwidth + (map.tileSize.width / 2)
                let y = CGFloat(row) * map.tileSize.height - halfheight + (map.tileSize.height / 2)
                if tiledefintion?.name == "stone_1"{
                    
                }
               if tiledefintion?.name == "tallestGrass" {
                let tallsprite = SKSpriteNode(color: UIColor.clear, size: map.tileSize)
                tallsprite.position = CGPoint(x: x, y: y)
                 self.addChild(tallsprite)
                tilearray.append(tallsprite)
                }
                
                if ((leftdefintion?.name == "grass" || rightdefintion?.name == "grass" || updefintion?.name == "grass" || downdefintion?.name == "grass") || (leftdefintion?.name == "tallestGrass" || rightdefintion?.name == "tallestGrass" || updefintion?.name == "tallestGrass" || downdefintion?.name == "tallestGrass")) && tiledefintion?.name == "bush" {
                let bushsprite = SKSpriteNode(color: UIColor.clear, size: map.tileSize)
                bushsprite.position = CGPoint(x: x, y: y)
                
                bushsprite.physicsBody = SKPhysicsBody(rectangleOf: map.tileSize)
                bushsprite.physicsBody?.affectedByGravity = false
                bushsprite.physicsBody?.pinned = true
                bushsprite.physicsBody?.allowsRotation = false
                bushsprite.physicsBody?.categoryBitMask = 1
                bushsprite.physicsBody?.collisionBitMask = 1
                bushsprite.physicsBody?.isDynamic = false
                self.addChild(bushsprite)
                }
             
               
              
            }
           
        }
    }
    
}

