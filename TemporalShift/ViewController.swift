//
//  ViewController.swift
//  TemporalShift
//
//  Created by Florian Bruggisser on 04.03.19.
//  Copyright © 2019 Florian Bruggisser. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isIdleTimerDisabled = true
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
    
        // create new location
        let location = LidarLocation(name: "Seepromenade", cloudName: "Seepromenade_2m_mod")
        location.setup(sceneRenderer: sceneView)
        let scene = location.scene
        
        // scale cloud
        let cloud = scene.rootNode.childNode(withName: "cloud", recursively: true)!
        cloud.scale = SCNVector3(0.1, 0.1, 0.1)
        
        // Set the scene to the view
        sceneView.scene = scene
        sceneView.overlaySKScene = location.hud
        sceneView.overlaySKScene?.isUserInteractionEnabled = false
        sceneView.scene.background.contents = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
    // Override to create and configure nodes for anchors added to the view's session.
    /*
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
 */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
