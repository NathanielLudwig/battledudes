//
//  dudedata.swift
//  dungeongame
//
//  Created by 90303405 on 12/5/18.
//  Copyright © 2018 90303054. All rights reserved.
//

import Foundation


import SpriteKit
import GameplayKit

class dudeData {
    
    struct dudeVars{
        
        static var Dudedex = ["Furtle","Sharkle","Grasster","Feaver","Mr. Ghost","Rabbice","Leamoeba"]
        static var currentDude = ""
        static var currentDudeHealth = 0.0
        static var currentDudeAttack = 0.0
        static var currentDudeSpeed = 0.0
        static var dudeHealthTotal = 0.0
        static var grassterHealth = 100.0
        static var grassterAttack = 12.0
        static var grassterSpeed = 10.0
        static var furtleHealth = 90.0
        static var furtleAttack = 20.0
        static var furtleSpeed = 5.0
        static var sharkleHealth = 110.0
        static var sharkleAttack = 15.0
        static var sharkleSpeed = 12.0
        static var position = CGPoint(x: -622, y: -629)
        static var feaverHealth = 100.0
        static var feaverAttack = 15
        static var mrghostHealth = 105.0
        static var mrghostAttack = 13
        static var rabbiceHealth = 105.0
        static var rabbiceAttack = 14
        static var leamoebaHealth = 107.0
        static var leamoebaAttack = 14
    }

    struct dudeMoves {
        
        static var currentMoves = ["","","",""]
        static var currentEnemyMoves = ["","","",""]
        static var grassterMoves = ["Leaf Cutter","Tree Bomb","Grass Hit","Root Absorb"]
        static var furtleMoves = ["Lava Shot","Heat Breath","Laser Eyes","Refuel"]
        static var sharkleMoves = ["Snorkle Shot","Bubble Blast","Super Bite","Osmosis"]
        static var feaverMoves = ["Flaming log","Dam you","Tail Slap","Eat wood"]
        static var mrghostMoves = ["Slime","Laser Eyes","Purple Punch","Undead Heal"]
        static var rabbiceMoves = ["Sub Zero","Freeze Tail","Blizzard Breath","Defrost"]
        static var leamoebaMoves = ["Solar Shot","Leaf Slash","Stem Slam","Grass Grow"]
    }
    
    struct enemyVars {
        
        static var currentEnemy = ""
        static var enemy = 0.0
        static var currentEnemyHealth = 0.0
        static var currentEnemyAttack = 0.0
        static var currentEnemySpeed = 0.0
        static var enemyHealthTotal = 0.0
        
    }
  
}

