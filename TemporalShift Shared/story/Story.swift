//
//  Story.swift
//  TemporalShift
//
//  Created by Florian Bruggisser on 26.02.19.
//  Copyright © 2019 Florian Bruggisser. All rights reserved.
//

import Foundation

class Story
{
    private var locationIndex = 0
    
    var locations = [Location]()
    
    var currentLocation : Location {
        get {
            return locations[locationIndex]
        }
    }
    
    init(locations : [Location] = [Location]()) {
        self.locations = locations
    }
    
    public func nextLocation() -> Location
    {
        locationIndex += 1
        return currentLocation
    }
}
