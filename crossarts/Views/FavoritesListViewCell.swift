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
    @IBOutlet weak var imgFavCell: UIView!
    @IBOutlet weak var titleFavList: UILabel!
    @IBOutlet weak var textFavList: UITextField!
    
    var artwork: Artwork! {
        didSet {
            self.updateUI()
        }
    }
    
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
        setBoarders()
    }
    
    func setBoarders() {
        imgFavList.layer.cornerRadius = 13.33
        imgFavList.layer.masksToBounds = true
        imgFavCell?.layer.cornerRadius = 13.33
    }
  
//    func yo() {
//        guard let customFont = UIFont(name: "Lato-Black", size: UIFont.labelFontSize) else {
//            fatalError("""
//    Failed to load the "CustomFont-Light" font.
//    Make sure the font file is included in the project and the font name is spelled correctly.
//    """
//            )
//        }
//        titleFavList.font = customFont //UIFontMetrics.default.scaledFont(for: customFont)
//        //label.adjustsFontForContentSizeCategory = true
//    }
}




