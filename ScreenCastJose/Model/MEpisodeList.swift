//
//  MEpisodeList.swift
//  ScreenCastJose
//
//  Created by Neil García on 11/10/17.
//  Copyright © 2017 Neil. All rights reserved.
//

import Foundation
import ObjectMapper

struct MEpisodeList: Mappable {
    
    var episodes = [MEpisode]()
    init() {}
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        episodes     <- map["episodes"]
    }
    
    
}
