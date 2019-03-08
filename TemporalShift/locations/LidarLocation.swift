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
    var anomalies = Array<Anomaly>()
    
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
        infoLabel.color = SKColor.blue
        infoLabel.text = "Location: \(name)"
        infoLabel.fontSize = 14.0;
        infoLabel.fontColor = SKColor.green
        infoLabel.position = CGPoint(x: 20, y: frameSize.height - 50)
        hud.addChild(infoLabel)
    }
    
    func setupAnomalies() {
        // find all images
        let images = scene.rootNode.childNodes { (node, _) -> Bool in
            node.name == "image"
        }
        
        // create anomalies
        anomalies = images.map({ (node) -> Anomaly in
            return Anomaly(image: node)
        })
    }
    
    override func setup(sceneRenderer : SCNView)
    {
        super.setup(sceneRenderer: sceneRenderer)
        
        // load pointcloud and add it to scene
        scene.rootNode.addChildNode(loadCloud(cloudName: cloudName))
        
        // setup anomalies
        setupAnomalies()
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        
        scene.rootNode.addChildNode(cameraNode)
        
        // setup camera
        let camera = cameraNode.camera!
        camera.usesOrthographicProjection = false
        camera.orthographicScale = 9
        camera.zNear = 0.005
        camera.zFar = 10000
        cameraNode.position = SCNVector3Make(0, 0, 0)
        
        setupHud(frameSize: sceneRenderer.frame.size)
    }
}
