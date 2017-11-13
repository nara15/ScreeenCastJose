//
//  VideoViewController.swift
//  ScreenCastJose
//
//  Created by Neil García on 11/10/17.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit
import WebKit

class VideoViewController: UIViewController {

    @IBOutlet weak var videoplayWebView: WKWebView!
    
    lazy var episodeViewModel = EpisodeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initUI() {
        if let videoURL = episodeViewModel.videoURL {
            let urlRequest = URLRequest(url: videoURL)
            videoplayWebView.load(urlRequest)
        }
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
