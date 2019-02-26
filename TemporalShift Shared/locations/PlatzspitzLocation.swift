//
//  PlatzspitzLocation.swift
//  TemporalShift
//
//  Created by Florian Bruggisser on 26.02.19.
//  Copyright © 2019 Florian Bruggisser. All rights reserved.
//

import Foundation

class PlatzspitzLocation : BaseLocation
{
    init()
    {
        super.init(name: "Platzspitz")
    }
    
    override func setup()
    {
        // load pointcloud and add it to scene
        scene.rootNode.addChildNode(loadCloud(cloudName: "Platzspitz_5m"))
    }
}
