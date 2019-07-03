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
    
    var favorites:Array<Int> = []
    var artworks:Array<Artwork> = []

    
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
