//
//  LocationUtils.swift
//  TemporalShift
//
//  Created by Florian Bruggisser on 26.02.19.
//  Copyright © 2019 Florian Bruggisser. All rights reserved.
//

import Foundation
import SceneKit

extension Location
{
    func loadCloud(cloudName : String) -> SCNNode
    {
        let scene = SCNScene(named: "art.scnassets/\(cloudName).scn")!
        return scene.rootNode.childNode(withName: "cloud", recursively: true)!
    }
}
