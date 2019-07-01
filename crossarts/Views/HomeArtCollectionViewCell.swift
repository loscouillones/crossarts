//
//  HomeArtCollectionViewCell.swift
//  crossarts
//
//  Created by Nico on 28/06/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import UIKit

class HomeArtCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var triviaTextField: UITextField!
    
    var art: Artwork! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.borderWidth = 1.0
        
        if let art = art {
            titleImageView.image = UIImage(named: "Joconde")
            titleLabel.text = art.title
            triviaTextField.text = art.trivia
        } else {
            titleImageView.image = nil
            titleLabel.text = nil
            triviaTextField.text = nil
        }
        
        setBorders()
    }
    
    func setBorders() {
        backView.layer.cornerRadius = 10.0
        backView.layer.masksToBounds = true

        titleImageView.layer.cornerRadius = 10.0
        titleImageView.layer.masksToBounds = true
    }
    
}
