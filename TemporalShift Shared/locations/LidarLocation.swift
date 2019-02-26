//
//  SeepromenadeLocation.swift
//  TemporalShift
//
//  Created by Florian Bruggisser on 26.02.19.
//  Copyright © 2019 Florian Bruggisser. All rights reserved.
//

import Foundation
import SceneKit

class LidarLocation : BaseLocation {
    var cloudName : String
    
    init(name : String, cloudName : String)
    {
        self.cloudName = cloudName
        
        super.init(name: name)
        
        setupHud()
    }
    
    func setupHud()
    {
        
    }
    
    override func setup(sceneRenderer : SCNView)
    {
        super.setup(sceneRenderer: sceneRenderer)
        
        // load pointcloud and add it to scene
        scene.rootNode.addChildNode(loadCloud(cloudName: cloudName))
    }
}
