//
//  EpisodeViewModel.swift
//  ScreenCastJose
//
//  Created by Neil García on 11/10/17.
//  Copyright © 2017 Neil. All rights reserved.
//

import Foundation

class EpisodeViewModel {
    
    private var episode = MEpisode()
    
    init(){ }
    
    convenience init(episode: MEpisode) {
        self.init()
        self.episode = episode
    }
    
    var title: String {
        return episode.title
    }
    
    var description: String {
        return episode.description
    }
    
    var largeArtwork: URL? {
        return episode.largeArtworkURL
    }
    
    var videoURL: URL? {
        return episode.videoURL
    }
}
