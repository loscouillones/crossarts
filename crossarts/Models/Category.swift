//
//  Category.swift
//  crossarts
//
//  Created by Nico on 28/06/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import Foundation

struct Category:Equatable, CustomStringConvertible {
    var description: String {
        get {
            return "Category: \(name) (\(id))"
        }
    }
    
    let id: Int
    let name: String
    let color: String
    
    static let categories:Array<Category> = [
        Category(id: 0, name: "Animation", color: "rgb(0,0,0)"),
        Category(id: 1, name: "Cinéma", color: "rgb(0,0,0)"),
        Category(id: 2, name: "Danse", color: "rgb(0,0,0)"),
        Category(id: 3, name: "Jeux-vidéo", color: "rgb(0,0,0)"),
        Category(id: 4, name: "Littérature", color: "rgb(0,0,0)"),
        Category(id: 5, name: "Musique", color: "rgb(0,0,0)"),
        Category(id: 6, name: "Peinture", color: "rgb(0,0,0)"),
        Category(id: 7, name: "Street Art", color: "rgb(0,0,0)"),
        Category(id: 8, name: "Tatouage", color: "rgb(0,0,0)")
    ]
    
    static func getCategory(_ id: Int) -> Category {
        let cat = categories.first { (category) -> Bool in
            return category.id == id
        }
        
        return cat!
    }
    
    static func ==(le: Category, re: Category) -> Bool {
        return le.id == re.id
    }
}
