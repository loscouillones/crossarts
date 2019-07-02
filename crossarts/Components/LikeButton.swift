//
//  LikeButton.swift
//  crossarts
//
//  Created by Nico on 02/07/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import Foundation
import UIKit

//
//  LikeButton.swift
//  crossarts
//
//  Created by Nico on 02/07/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import UIKit
import Lottie

class LikeButton: UIButton {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    var animationView: AnimationView
    
    var isLiked:Bool = false {
        didSet {
            if isLiked {
                animationView.play(fromProgress: 1, toProgress: 1)
            } else {
                animationView.play(fromProgress: 0, toProgress: 0)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        animationView = AnimationView(name: "like-anim")
        
        super.init(coder: aDecoder)
    }
    
    func prepareAnimation() {
        // Do any additional setup after loading the view
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 2.0

        animationView.center = self.center
        let width = self.frame.width
        let height = self.frame.height
        animationView.frame = CGRect(x: -width/2, y: -height/2, width: 300, height: 300)

        animationView.contentMode = .scaleAspectFill
        
        self.addSubview(animationView)
        
        animationView.play(fromProgress: 1, toProgress: 1)
    }
    
    func doLike() {
        animationView.play(fromProgress: 0, toProgress: 1)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.prepareAnimation()
    }
}

