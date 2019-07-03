//
//  HomeArtCollectionViewCell.swift
//  crossarts
//
//  Created by Nico on 28/06/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import UIKit

class HomeArtCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var homeUIView: UIView!
    
    @IBOutlet weak var homeImageView: UIImageView!
    
    @IBOutlet weak var homeTextView: UITextView!
    
    @IBOutlet weak var homeTitleLabel: UILabel!
    
    @IBOutlet weak var likeButton: LikeButton!
    
    @IBOutlet weak var homeTitleField: UITextView!
    
    var art: Artwork! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
//        self.layer.borderColor = UIColor.blue.cgColor
//        self.layer.borderWidth = 1.0
        
        if let art = art {
           // homeImageView.image = UIImage(named: "Stones")
            homeImageView.download(from: art.portraitUrl)
            homeTextView.text = art.trivia
            // homeTitleLabel.text = art.title
            homeTitleField.text = art.title
            homeTitleField.textContainer.lineBreakMode = .byWordWrapping
        } else {
            homeImageView.image = nil
            // homeTitleLabel.text = nil
            homeTitleField.text = nil
            homeTextView.text = nil
        }
        
        // get favorite status
        likeButton.isLiked = User.settings.hasFavorite(favoriteId: art.id)
        print("isLiked: \(likeButton.isLiked)")
        
        setBorders()
        // setShadow()
    }
    
    func setBorders() {
        homeUIView.layer.cornerRadius = 18.0
        homeUIView.layer.masksToBounds = true
        
        homeImageView.layer.cornerRadius = 18.0
        homeImageView.layer.masksToBounds = true
    }
    
    @IBAction func onLikeTap(_ sender: Any) {
        print("Click on like for artwork: \(art.id)")
        likeButton.isLiked = !likeButton.isLiked
        
        if likeButton.isLiked {
            likeButton.doLike()
            User.settings.addFavorite(favoriteId: art.id)
        } else {
            User.settings.removeFavorite(favoriteId: art.id)
        }
    }
    
    func setShadow() {
        // homeImageView.dropShadow()
//        var shadowLayer: CAShapeLayer!
//        let cornerRadius: CGFloat = 18.0
//        let fillColor: UIColor = .white
//
//        if shadowLayer == nil {
//            shadowLayer = CAShapeLayer()
//
//            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
//            shadowLayer.fillColor = fillColor.cgColor
//
//            shadowLayer.shadowColor = UIColor.black.cgColor
//            shadowLayer.shadowPath = shadowLayer.path
//            shadowLayer.shadowOffset = CGSize(width: -2.0, height: 2.0)
//            shadowLayer.shadowOpacity = 0.8
//            shadowLayer.shadowRadius = 2
//
//            homeUIView.layer.insertSublayer(shadowLayer, at: 0)
//        }
    }
    
}
