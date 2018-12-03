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
    var attackbutton = SKSpriteNode()
    var sword = SKSpriteNode()
    
    
    
    override func didMove(to view: SKView) {
        dude = self.childNode(withName: "dude") as! SKSpriteNode
        upbutton = camera?.childNode(withName: "up") as! SKSpriteNode
        leftbutton = camera?.childNode(withName: "left") as! SKSpriteNode
        rightbutton = camera?.childNode(withName: "right") as! SKSpriteNode
        downbutton = camera?.childNode(withName: "down") as! SKSpriteNode
        attackbutton = camera?.childNode(withName: "attack") as! SKSpriteNode
        sword = dude.childNode(withName: "sword") as! SKSpriteNode
        sword.position = CGPoint(x: dude.frame.midX, y: dude.frame.midY)
        
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
        //sword.removeFromParent()
        sword.isHidden = true
       
    }
    
    func showsword(){
        
        let wait = SKAction.wait(forDuration: 0.5)
        let show = SKAction.unhide()
        let hide = SKAction.hide()
        //sword.run(showaction)
       
        sword.run(SKAction.sequence([show,wait, hide]))
       
    }
   
    func handletouches(touches: Set<UITouch>){
        guard let touch = touches.first else {return}
        let touchlocation = touch.location(in: camera!)
        if attackbutton.contains(touchlocation) {
            
            showsword()
            
        }
        if upbutton.contains(touchlocation) {
            
            dudeVert = 1
            dude.run(SKAction.repeatForever(
                SKAction.animate(with: upanimation,
                                 timePerFrame: 0.1,
                                 resize: false,
                                 restore: false)), withKey: runningkey)
            sword.zRotation = 0
        }
        if downbutton.contains(touchlocation){
            dudeVert = -1
            dude.run(SKAction.repeatForever(
                SKAction.animate(with: downanimation,
                                 timePerFrame: 0.1,
                                 resize: false,
                                 restore: false)), withKey: runningkey)
            sword.zRotation = CGFloat.pi
           
        }
        if rightbutton.contains(touchlocation){
            dudeHorz = 1
            
            dude.run(SKAction.repeatForever(
                SKAction.animate(with: rightanimation,
                                 timePerFrame: 0.1,
                                 resize: false,
                                 restore: false)))
            
            sword.zRotation = -(CGFloat.pi / 2)
            
        
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
        if sword.isHidden == false{
            
        }
       
        
        
    }
    
    
    
    
    func givePhysicsBody(map: SKTileMapNode){
        let map = map
        
        let halfheight = CGFloat(map.numberOfRows) / 2.0 * map.tileSize.height
        let halfwidth = CGFloat(map.numberOfColumns) / 2.0 * map.tileSize.width
        for col in 0 ..< map.numberOfColumns {
            for row in 0..<map.numberOfRows {
                
                let tiledefintion = map.tileDefinition(atColumn: col, row: row)
                let x = CGFloat(col) * map.tileSize.width - halfwidth + (map.tileSize.width / 2)
                let y = CGFloat(row) * map.tileSize.height - halfheight + (map.tileSize.height / 2)
                if tiledefintion?.name == "stone_1"{
                    
                }
                if tiledefintion?.name == "wall" {
                    
                
                let tilesprite = SKSpriteNode(color: UIColor.clear, size: map.tileSize)
                tilesprite.position = CGPoint(x: x, y: y)
                tilesprite.physicsBody = SKPhysicsBody(rectangleOf: map.tileSize)
                tilesprite.physicsBody?.affectedByGravity = false
                tilesprite.physicsBody?.pinned = true
                tilesprite.physicsBody?.allowsRotation = false
                tilesprite.physicsBody?.categoryBitMask = UInt32(2)
                tilesprite.physicsBody?.collisionBitMask = UInt32(2)
                self.addChild(tilesprite)
                }
                
            }
           
        }
    }
}

