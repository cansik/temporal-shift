//
//  GameController.swift
//  TemporalShift Shared
//
//  Created by Florian Bruggisser on 26.02.19.
//  Copyright © 2019 Florian Bruggisser. All rights reserved.
//

import SceneKit

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
        sceneRenderer.overlaySKScene!.isUserInteractionEnabled = false
        
        // add ended handler
        location.onEnded.addHandler { (Location) in
            self.loadLocation(location: self.story.nextLocation())
        }
    }
    
    func changeLocation()
    {
        loadLocation(location: story.nextLocation())
    }
    
    func onChangeLocationRequested(atPoint point: CGPoint) {
        changeLocation()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        // Called before each frame is rendered
    }

}
