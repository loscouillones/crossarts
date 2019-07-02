//
//  FavoritesViewController.swift
//  crossarts
//
//  Created by Florent Heyraud on 01/07/2019.
//  Copyright © 2019 Nico. All rights reserved.
//
import UIKit
import Foundation

class FavoritesViewController: UITableViewController {

    @IBOutlet var favoritesTableView: UITableView!
    
    var favorites = [1, 2, 3]
    
    var artworks = [Artwork(id: 1,
                            landscapeUrl: "lanscape1",
                            portraitUrl: "portrait1",
                            thumbUrl: "apple",
                            description: "desc1",
                            title: "title1",
                            trivia: "trivia1",
                            related: [],
                            categoryId: 1,
                            tags: [],
                            date: Date()),
                    Artwork(id: 2,
                            landscapeUrl: "lanscape2",
                            portraitUrl: "portrait2",
                            thumbUrl: "apple2",
                            description: "desc2",
                            title: "title2",
                            trivia: "trivia2",
                            related: [],
                            categoryId: 2,
                            tags: [],
                            date: Date()),
                    Artwork(id: 3,
                            landscapeUrl: "lanscape3",
                            portraitUrl: "portrait3",
                            thumbUrl: "apple3",
                            description: "desc3",
                            title: "title3",
                            trivia: "trivia3",
                            related: [],
                            categoryId: 2,
                            tags: [],
                            date: Date())]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesListViewCell2", for: indexPath) as! FavoritesListViewCell
        let favID = favorites[indexPath.item]
        let artwork = artworks.first(where: { $0.id == favID } )

        cell.artwork = artwork
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTableView.dataSource = self
        self.tableView.rowHeight = 130.0
    }
    
}
