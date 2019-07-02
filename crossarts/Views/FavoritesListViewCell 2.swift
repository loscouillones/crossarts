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
    @IBOutlet weak var textFavList: UITextField!
    
    func updateUI() {
        imgFavList.image = UIImage(named: "Joconde")
        titleFavList.text = artwork.title
        textFavList.text = artwork.description
        
        if let artwork = artwork {
            imgFavList.image = UIImage(named: "Joconde")
            titleFavList.text = artwork.title
            textFavList.text = artwork.description
        } else {
            imgFavList.image = nil
            titleFavList.text = nil
            textFavList.text = nil
        }
    }
    
    var artwork: Artwork! {
        didSet {
            self.updateUI()
        }
    }
}
