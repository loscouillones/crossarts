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
//        self.layer.borderColor = UIColor.red.cgColor
//        self.layer.borderWidth = 2.0
//
//        animationView.layer.borderColor = UIColor.blue.cgColor
//        animationView.layer.borderWidth = 10.0
        
        // force the width/height to 200: the animation doesn't seem to scale properly
        // no idea why
        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        // then center the animation inside the button
        animationView.center = CGPoint(x: self.layer.frame.width / 2, y: self.layer.frame.height / 2)
        animationView.contentMode = .scaleAspectFill
       
        // let taps bubble up to the button
        animationView.isUserInteractionEnabled = false
        
        self.addSubview(animationView)
        
        animationView.play(fromProgress: 1, toProgress: 1)
    }
    
    func doLike() {
        animationView.play(fromProgress: 0, toProgress: 1)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        self.prepareAnimation()
    }
}

