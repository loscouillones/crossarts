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
    
    
    @IBOutlet weak var relatedOverlay1: UIView!
    
    @IBOutlet weak var relatedOverlay2: UIView!
    
    
    @IBOutlet weak var relatedOverlay3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        
        // Do any additional setup after loading the view.
    }
    
    func setBackButtonTitle(_ text: String) {
        // set back button
        let backItem = UIBarButtonItem()
        backItem.title = text
        navigationItem.backBarButtonItem = backItem
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
                let category = Category.getCategory(relatedArtwork!.categoryId)
                
                relatedLabel1.text = category.name
                relatedImageView1.download(from: relatedArtwork!.thumbUrl)
                relatedImageView1.layer.cornerRadius = 13
                relatedImageView1.layer.masksToBounds = true
                relatedOverlay1.layer.cornerRadius = 13
                relatedOverlay1.layer.masksToBounds = true
            }
            
            // related 2
            if artwork!.related.count > 1 {
                let relatedId = artwork!.related[1]
                let relatedArtwork = Artwork.getArtwork(id: relatedId)
                let category = Category.getCategory(relatedArtwork!.categoryId)
                relatedLabel2.text = category.name
                relatedImageView2.download(from: relatedArtwork!.thumbUrl)
                relatedImageView2.layer.cornerRadius = 13
                relatedImageView2.layer.masksToBounds = true
                relatedOverlay2.layer.cornerRadius = 13
                relatedOverlay2.layer.masksToBounds = true
            }
            
            // related 3
            if artwork!.related.count > 2 {
                let relatedId = artwork!.related[2]
                let relatedArtwork = Artwork.getArtwork(id: relatedId)
                let category = Category.getCategory(relatedArtwork!.categoryId)
                relatedLabel3.text = category.name
                relatedImageView3.download(from: relatedArtwork!.thumbUrl)
                relatedImageView3.layer.cornerRadius = 13
                relatedImageView3.layer.masksToBounds = true
                relatedOverlay3.layer.cornerRadius = 13
                relatedOverlay3.layer.masksToBounds = true
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
    
    func openRelated(_ relatedIndex: Int) {
        // set back button
        let backItem = UIBarButtonItem()
        backItem.title = artwork?.title
        navigationItem.backBarButtonItem = backItem
        
        // first get storyboard ref
        let storyboard = UIStoryboard(name: "HomeAndDetails", bundle: nil)
        
        // then instanciate controller
        let viewController = storyboard.instantiateViewController(withIdentifier: "ArtDetailController") as! ArtDetailViewController
        
        viewController.artwork = Artwork.getArtwork(id: relatedIndex)
        
        // finally push it
        self.navigationController?.pushViewController(viewController, animated:true)
    }
    
    @IBAction func onRelated1Tap(_ sender: Any) {
        openRelated(artwork!.related[0])
    }
    
    @IBAction func onRelated2Tap(_ sender: Any) {
        openRelated(artwork!.related[1])
    }
    
    @IBAction func onRelated3Tap(_ sender: Any) {
        openRelated(artwork!.related[2])
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
