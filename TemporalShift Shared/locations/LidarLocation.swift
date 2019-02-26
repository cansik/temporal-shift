//
//  SeepromenadeLocation.swift
//  TemporalShift
//
//  Created by Florian Bruggisser on 26.02.19.
//  Copyright © 2019 Florian Bruggisser. All rights reserved.
//

import Foundation
import SceneKit
import SpriteKit

class LidarLocation : BaseLocation {
    var cloudName : String
    
    init(name : String, cloudName : String)
    {
        self.cloudName = cloudName
        
        super.init(name: name)
    }
    
    func setupHud(frameSize : CGSize)
    {
        // show location name
        let infoLabel = SKLabelNode()
        infoLabel.horizontalAlignmentMode = .left
        infoLabel.color = SCNColor.blue
        infoLabel.text = "Location: \(name)"
        infoLabel.fontSize = 14.0;
        infoLabel.fontColor = SCNColor.green
        infoLabel.position = CGPoint(x: 20, y: frameSize.height - 50)
        hud.addChild(infoLabel)
    }
    
    override func setup(sceneRenderer : SCNView)
    {
        super.setup(sceneRenderer: sceneRenderer)
        
        // load pointcloud and add it to scene
        scene.rootNode.addChildNode(loadCloud(cloudName: cloudName))
        
        setupHud(frameSize: sceneRenderer.frame.size)
    }
}
