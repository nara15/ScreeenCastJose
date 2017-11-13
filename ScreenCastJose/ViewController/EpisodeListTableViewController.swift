//
//  EpisodeListTableViewController.swift
//  ScreenCastJose
//
//  Created by Neil García on 11/10/17.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit
import RxSwift

class EpisodeListTableViewController: UITableViewController {

    lazy var episodeListViewModel = EpisodeListViewModel()
    let disposeBag = DisposeBag()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setupSignals()
        episodeListViewModel.getEpisodes()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func initUI() {
        tableView.estimatedRowHeight = 61
        tableView.rowHeight = UITableViewAutomaticDimension
        navigationItem.hidesBackButton = true
        
        //  Search bar configuration
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func setupSignals() {
        episodeListViewModel.updatedContentSignal.observeOn(MainScheduler.instance).subscribe(onNext: { [weak self] (_) in
            if let strongSelf = self {
                strongSelf.tableView.reloadData()
            }
        }).disposed(by: disposeBag)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return episodeListViewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeListViewModel.numberOfRows(section: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as? EpisodeTableViewCell else {
            fatalError("Can't dequeue the tableview cell")
        }
        
        cell.setupCell(title: episodeListViewModel.title(indexPath: indexPath), subtitle: episodeListViewModel.subTitle(indexPath: indexPath), imageURL: episodeListViewModel.smallArtWorkURL(indexPath: indexPath))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = episodeListViewModel.object(indexPath: indexPath)
        let episodeViewModel = EpisodeViewModel(episode: episode)
        performSegue(withIdentifier: "ShowEpisodeDetailSegue", sender: episodeViewModel)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEpisodeDetailSegue" {
            
            if let episodeDetailViewController = segue.destination as? EpisodeDetailViewController, let episodeViewModel = sender as? EpisodeViewModel {
                episodeDetailViewController.episodeViewModel = episodeViewModel
            }
        }
    }
    
}


//  Extend our controller to use it with the search bar.

extension EpisodeListTableViewController: UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        if let searchForText = searchController.searchBar.text, !searchForText.isEmpty
        {
            episodeListViewModel.isFiltered = true
            episodeListViewModel.filter(by: searchForText)
            tableView.reloadData()
        }
        else
        {
            episodeListViewModel.isFiltered = false
            tableView.reloadData()
        }
    }
}

extension EpisodeListTableViewController: UISearchBarDelegate
{
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        episodeListViewModel.isFiltered = false
        tableView.reloadData()
    }
}
