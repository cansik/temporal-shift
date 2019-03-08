//
//  Anomaly.swift
//  TemporalShift
//
//  Created by Florian Bruggisser on 08.03.19.
//  Copyright © 2019 Florian Bruggisser. All rights reserved.
//

import Foundation
import SceneKit

class Anomaly {
    
    let image : SCNNode
    let material : SCNMaterial
    
    var vertexShader : String = ""
    var fragmentShader : String = ""
    
    init(image : SCNNode) {
        self.image = image
        self.material = (image.geometry?.materials.first)!
        
        loadShader()
        attachShader()
    }
    
    private func loadShader() {
        do {
            vertexShader = try String(contentsOfFile: (Bundle.main.url(forResource: "anomalyVertex", withExtension: "glsl")?.path)!, encoding: .utf8)
            fragmentShader = try String(contentsOfFile: (Bundle.main.url(forResource: "anomalyFragment", withExtension: "glsl")?.path)!, encoding: .utf8)
        } catch {
            print(error)
        }
    }
    
    private func attachShader()
    {
        material.shaderModifiers = [
            SCNShaderModifierEntryPoint.geometry: vertexShader,
            SCNShaderModifierEntryPoint.fragment: fragmentShader
        ];
    }
}
