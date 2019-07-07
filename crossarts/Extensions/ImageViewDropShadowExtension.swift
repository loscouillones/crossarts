//
//  ImageViewDropShadowExtension.swift
//  crossarts
//
//  Created by Nico on 02/07/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func dropShadow() {
        let radius: CGFloat = self.frame.width / 2.0 //change it to .height if you need spread for height
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 2.1 * radius, height: self.frame.height))
        // self.layer.cornerRadius = 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)  //Here you control x and y
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 5.0 //Here your control your blur
        self.layer.masksToBounds =  false
        self.layer.shadowPath = shadowPath.cgPath
        //Change 2.1 to amount of spread you need and for height replace the code for height
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowOffset = CGSize(width: -1, height: 1)
//        self.layer.shadowRadius = 1
//        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//        self.layer.shouldRasterize = true
//        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
