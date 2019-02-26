//
//  GameController.swift
//  TemporalShift Shared
//
//  Created by Florian Bruggisser on 26.02.19.
//  Copyright © 2019 Florian Bruggisser. All rights reserved.
//

import SceneKit

#if os(watchOS)
    import WatchKit
#endif

#if os(macOS)
    typealias SCNColor = NSColor
#else
    typealias SCNColor = UIColor
#endif

class GameController: NSObject, SCNSceneRendererDelegate {
    let sceneRenderer: SCNView
    
    let story = Story(locations: [
        LidarLocation(name: "Platzspitz", cloudName: "Platzspitz_5m"),
        LidarLocation(name: "Seepromenade", cloudName: "Seepromenade_2m")
        ])
    
    init(sceneRenderer renderer: SCNView) {
        sceneRenderer = renderer
        super.init()
        
        sceneRenderer.delegate = self
        
        loadLocation(location: story.currentLocation)
    }
    
    func loadLocation(location : Location) {
        location.setup(sceneRenderer: sceneRenderer)
        
        sceneRenderer.scene = location.scene
        sceneRenderer.overlaySKScene = location.hud
        
        // add ended handler
        location.onEnded.addHandler { (Location) in
            self.loadLocation(location: self.story.nextLocation())
        }
    }
    
    func changeLocation()
    {
        loadLocation(location: story.nextLocation())
    }
    
    func highlightNodes(atPoint point: CGPoint) {
        let hitResults = self.sceneRenderer.hitTest(point, options: [:])
        for result in hitResults {
            // get its material
            guard let material = result.node.geometry?.firstMaterial else {
                return
            }
            
            // highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            
            // on completion - unhighlight
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                
                material.emission.contents = SCNColor.black
                
                SCNTransaction.commit()
            }
            
            material.emission.contents = SCNColor.red
            
            SCNTransaction.commit()
        }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        // Called before each frame is rendered
    }

}
