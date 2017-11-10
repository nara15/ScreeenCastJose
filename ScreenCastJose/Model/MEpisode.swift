//
//  MEpisode.swift
//  ScreenCastJose
//
//  Created by Neil García on 11/10/17.
//  Copyright © 2017 Neil. All rights reserved.
//

import Foundation
import ObjectMapper

struct MEpisode: Mappable {
    
    var identifier = -1
    var title = ""
    var description = ""
    var dominantColor = ""
    var smallArtworkURL: URL?
    var largeArtworkURL: URL?
    var videoURL: URL?
    
    init() {}
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        identifier     <- map["id"]
        title     <- map["title"]
        description     <- map["description"]
        dominantColor     <- map["dominant_color"]
        smallArtworkURL     <- (map["small_artwork_url"], URLTransform())
        largeArtworkURL     <- (map["large_artwork_url"], URLTransform())
        videoURL     <- (map["video_url"], URLTransform())
    }
}
