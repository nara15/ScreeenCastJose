//
//  EpisodeListViewModel.swift
//  ScreenCastJose
//
//  Created by Neil García on 11/10/17.
//  Copyright © 2017 Neil. All rights reserved.
//

import Foundation
import RxSwift
import Moya_ObjectMapper

/// Episode List viewmodel get the episodes from a Webservices, also provide the List sections and rows.
class EpisodeListViewModel {
    
    let disposeBag = DisposeBag()
    private var episodeList = [MEpisode]()
    private var filteredEpisodes = [MEpisode]()
    var isFiltered = false
    
    /// Error loading signal
    lazy var updatedContentSignal = PublishSubject<Any?>()
    
    /// Get episode List from a WS.
    func getEpisodes() {
         moyaProvider.rx.request(.getEpisodes).mapObject(MEpisodeList.self).subscribe { [weak self] event in
            
            if let strongSelf = self {
                switch event {
                case .success(let response):
                    strongSelf.episodeList = response.episodes
                    strongSelf.updatedContentSignal.onNext(nil)
                    break
                // do something with the data
                case .error(let error):
                    print(error)
                    break
                }
            }
           
        }.disposed(by: disposeBag)
    }
    
    /// Filter by string content (in title)
    func filter(by value:String)
    {
        filteredEpisodes.removeAll()
        for episode in episodeList
        {
            if episode.title.lowercased().contains(value.lowercased())
            {
                filteredEpisodes.append(episode)
            }
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(section: Int) -> Int {
        var count = episodeList.count
        if self.isFiltered
        {
            count = filteredEpisodes.count
        }
        return count
    }
    
    func title(indexPath: IndexPath) -> String {
        return object(indexPath: indexPath).title
    }
    
    func subTitle(indexPath: IndexPath) -> String {
        return object(indexPath: indexPath).description
    }
    
    func smallArtWorkURL(indexPath: IndexPath) -> URL? {
        return object(indexPath: indexPath).smallArtworkURL
    }
    func largeArtWorkURL(indexPath: IndexPath) -> URL? {
        return object(indexPath: indexPath).largeArtworkURL
    }
    
    func object(indexPath: IndexPath) -> MEpisode {
        var object = episodeList[indexPath.row]
        if self.isFiltered
        {
            object = filteredEpisodes[indexPath.row]
        }
        return object
        //return episodeList[indexPath.row]
    }
    
    
}
