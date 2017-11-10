//
//  EpisodeDetailViewController.swift
//  ScreenCastJose
//
//  Created by Neil García on 11/10/17.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit
import SDWebImage

class EpisodeDetailViewController: UIViewController {
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeDescriptionLabel: UILabel!
    
    lazy var episodeViewModel = EpisodeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initUI() {
        title = episodeViewModel.title
        episodeDescriptionLabel.text = episodeViewModel.description
        if let imageURL = episodeViewModel.largeArtwork {
            episodeImageView.sd_setShowActivityIndicatorView(true)
            episodeImageView.sd_setIndicatorStyle(.gray)
            episodeImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder.png"))
        }
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PlayVideoSegue" {
            
            if let videoViewController = segue.destination as? VideoViewController
            {
                videoViewController.episodeViewModel = episodeViewModel
            }
        }
        
        
        
    }
    

}
