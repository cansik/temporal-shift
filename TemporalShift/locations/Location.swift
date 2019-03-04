//
//  Location.swift
//  TemporalShift
//
//  Created by Florian Bruggisser on 26.02.19.
//  Copyright © 2019 Florian Bruggisser. All rights reserved.
//

import Foundation
import SceneKit
import SpriteKit

protocol Location
{
    var name : String {
        get
    }
    
    var scene : SCNScene {
        get
    }
    
    var hud : SKScene {
        get
    }
    
    var onEnded : Event<Location> {
        get
    }
    
    func setup(sceneRenderer : SCNView)
}
