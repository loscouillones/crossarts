//
//  UIViewDebug.swift
//  crossarts
//
//  Created by Nico on 04/07/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func debug(_ color: UIColor = UIColor.blue) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 2
    }
}
