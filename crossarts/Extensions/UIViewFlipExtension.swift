//
//  UIViewFlipExtension.swift
//  crossarts
//
//  Created by Nico on 05/07/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /// Flip view horizontally.
    func flipX() {
        transform = CGAffineTransform(scaleX: -transform.a, y: transform.d)
    }
    
    /// Flip view vertically.
    func flipY() {
        transform = CGAffineTransform(scaleX: transform.a, y: -transform.d)
    }
}
