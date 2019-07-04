//
//  ArtDetailViewController.swift
//  crossarts
//
//  Created by Nico on 01/07/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import UIKit

class ArtDetailViewController: UIViewController {
    var artwork:Artwork?
    
    
    @IBOutlet weak var artLabel: UILabel!
    
    @IBOutlet weak var artImageView: UIImageView!
    
    
    @IBOutlet weak var artDescription: UITextView!
    @IBOutlet weak var relatedImageView1: UIImageView!
    
    
    @IBOutlet weak var relatedLabel1: UILabel!
    
    
    @IBOutlet weak var relatedImageView2: UIImageView!
    
    @IBOutlet weak var relatedLabel2: UILabel!
    
    @IBOutlet weak var relatedImageView3: UIImageView!
    
    @IBOutlet weak var relatedLabel3: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "detail"
        
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        if artwork != nil {
            artLabel.text = artwork?.title
            artDescription.text = artwork?.description
            artImageView.download(from: artwork!.landscapeUrl)
            
            // rounded corners
            artImageView.layer.cornerRadius = 13
            artImageView.layer.masksToBounds = true
            
            // related 1
            if artwork!.related.count > 0 {
                let relatedId = artwork!.related[0]
                let relatedArtwork = Artwork.getArtwork(id: relatedId)
                relatedLabel1.text = relatedArtwork?.title
                relatedImageView1.download(from: relatedArtwork!.thumbUrl)
            }
            
            // related 2
            if artwork!.related.count > 1 {
                let relatedId = artwork!.related[1]
                let relatedArtwork = Artwork.getArtwork(id: relatedId)
                relatedLabel2.text = relatedArtwork?.title
                relatedImageView2.download(from: relatedArtwork!.thumbUrl)
            }
            
            // related 3
            if artwork!.related.count > 2 {
                let relatedId = artwork!.related[2]
                let relatedArtwork = Artwork.getArtwork(id: relatedId)
                relatedLabel3.text = relatedArtwork?.title
                relatedImageView3.download(from: relatedArtwork!.thumbUrl)
            }
        } else {
            artLabel.text = nil
            artDescription.text = nil
            artImageView.image = nil
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
