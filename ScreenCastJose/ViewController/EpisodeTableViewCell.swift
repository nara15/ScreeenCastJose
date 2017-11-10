//
//  EpisodeTableViewCell.swift
//  ScreenCastJose
//
//  Created by Neil García on 11/10/17.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit
import SDWebImage

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeSubtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(title: String, subtitle: String, imageURL: URL?) {
        episodeTitleLabel.text = title
        episodeSubtitleLabel.text = subtitle
        if let imageURL = imageURL {
            episodeImageView.sd_setShowActivityIndicatorView(true)
            episodeImageView.sd_setIndicatorStyle(.gray)
            episodeImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder.png"))
        }
        
        
    }

}
