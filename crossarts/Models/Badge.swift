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
    
    static let defaultBadges: Array<Badge> = [
        Badge(id: 0, categoryId: 5, name: "Musique", subtitle: "", obtained: -1, views: 0, thresholds: [10, 20, 50]),
        Badge(id: 1, categoryId: 4, name: "Littérature", subtitle: "", obtained: -1, views: 0, thresholds: [10, 20, 50]),
        Badge(id: 2, categoryId: 6, name: "Peinture", subtitle: "", obtained: -1, views: 0, thresholds: [10, 20, 50]),
        Badge(id: 3, categoryId: 0, name: "Animation", subtitle: "", obtained: -1, views: 0, thresholds: [10, 20, 50]),
        Badge(id: 4, categoryId: 2, name: "Danse", subtitle: "", obtained: -1, views: 0, thresholds: [10, 20, 50]),
        Badge(id: 5, categoryId: 7, name: "Street Art", subtitle: "", obtained: -1, views: 0, thresholds: [10, 20, 50]),
        Badge(id: 6, categoryId: 3, name: "Jeux-vidéo", subtitle: "", obtained: -1, views: 0, thresholds: [10, 20, 50]),
        Badge(id: 7, categoryId: 8, name: "Tatouage", subtitle: "", obtained: -1, views: 0, thresholds: [10, 20, 50])
    ]
}
