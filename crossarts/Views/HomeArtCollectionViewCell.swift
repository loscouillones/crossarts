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
    var art: Artwork! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.borderWidth = 1.0
        
        if let art = art {
            homeImageView.image = UIImage(named: "Stones")
            homeTextView.text = art.trivia
            homeTitleLabel.text = art.title
        } else {
            homeImageView.image = nil
            homeTitleLabel.text = nil
            homeTextView.text = nil
        }
        
        //setBorders()
        setShadow()
    }
    
    func setBorders() {
        homeUIView.layer.cornerRadius = 18.0
        homeUIView.layer.masksToBounds = true
        
        homeImageView.layer.cornerRadius = 18.0
        homeImageView.layer.masksToBounds = true
    }
    
    func setShadow() {
        var shadowLayer: CAShapeLayer!
        let cornerRadius: CGFloat = 18.0
        let fillColor: UIColor = .white
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = fillColor.cgColor
            
            shadowLayer.shadowColor = UIColor.black.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: -2.0, height: 2.0)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 2
            
            homeUIView.layer.insertSublayer(shadowLayer, at: 0)
        }
    }
    
}
