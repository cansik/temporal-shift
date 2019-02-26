//
//  BaseLocation.swift
//  TemporalShift
//
//  Created by Florian Bruggisser on 26.02.19.
//  Copyright © 2019 Florian Bruggisser. All rights reserved.
//

import Foundation
import SceneKit
import SpriteKit

class BaseLocation : Location
{
    init(name : String) {
        self.name = name
        
        // setup objects
        self.scene = SCNScene()
        self.hud = SKScene()
    }
    
    var name : String = "BaseScene"
    
    var scene: SCNScene
    
    var hud: SKScene
    
    var onEnded : Event<Location> = Event()
    
    func setup(sceneRenderer : SCNView) {
        // resize hud
        self.hud.size = sceneRenderer.frame.size
    }
}
