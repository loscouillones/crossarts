//
//  Artwork.swift
//  crossarts
//
//  Created by Nico on 28/06/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import Foundation

struct Artwork {
    let id: Int
    let landscapeUrl: String
    let portraitUrl: String
    let thumbUrl: String
    let description: String
    let title: String
    let trivia: String
    let related: Array<Int>
    let categoryId: Int
    let tags: Array<String>
    let date: Date
    static var artworks: Array<Artwork> = []
    static func getArtwork(id: Int) -> Artwork? {
        if let index = artworks.firstIndex(where: {
            (artwork) -> Bool in artwork.id == id
        } ) {
            return artworks[index]
        } else {
            return nil
        }
    }
}
