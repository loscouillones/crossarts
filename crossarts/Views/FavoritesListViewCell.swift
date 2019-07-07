//
//  FavoritesListViewCell.swift
//  crossarts
//
//  Created by Imac FH on 01/07/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import Foundation
import UIKit

class FavoritesListViewCell:  UITableViewCell {
    
    @IBOutlet weak var imgFavList: UIImageView!
    @IBOutlet weak var titleFavList: UILabel!
   
    @IBOutlet weak var textFavList: UILabel!
    
    // delete + details buttons
    var cellDelegate: FavoriteCellDelegate?
    
    var artwork: Artwork! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let artwork = artwork {
            imgFavList.download(from: artwork.thumbUrl)
            titleFavList.text = artwork.title
            textFavList.text = artwork.description
        } else {
            imgFavList.image = nil
            titleFavList.text = nil
            textFavList.text = nil
        }
        setBorders()
        
    }
    
    func setBorders() {
        imgFavList.layer.cornerRadius = 13.33
        imgFavList.layer.masksToBounds = true
    }
    
  
    @IBAction func onDelete(_ sender: UIButton) {
        cellDelegate?.didPressDeleteButton(artwork.id)
    }
    
    
    @IBAction func onImageTap(_ sender: Any) {
        cellDelegate?.didPressImageButton(artwork.id)
    }
}




