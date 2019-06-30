//
//  Badge.swift
//  crossarts
//
//  Created by Imac FH on 29/06/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import Foundation

struct Badge {
    let id: Int
    let categoryId: Int
    let name: String
    let subtitle: String
    let obtained: Int
    let views: Int
    let thresholds: Array<Int>
}
