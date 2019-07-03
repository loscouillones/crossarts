//
//  FavoritesViewController.swift
//  crossarts
//
//  Created by Florent Heyraud on 01/07/2019.
//  Copyright © 2019 Nico. All rights reserved.
//
import UIKit
import Foundation

protocol FavoriteCellDelegate : class {
    func didPressDeleteButton(_ tag: Int)
}

class FavoritesViewController: UITableViewController, FavoriteCellDelegate {

    @IBOutlet var favoritesTableView: UITableView!
    
    var favoriteArtworks: Array<Artwork> = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return User.settings.favorites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesListCell", for: indexPath) as! FavoritesListViewCell

        cell.artwork = favoriteArtworks[indexPath.row]
        cell.cellDelegate = self
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTableView.dataSource = self
        self.tableView.rowHeight = 130.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        refreshData()
    }
    
    func refreshData() {
        // get list of favorites
        favoriteArtworks.removeAll()
        favoriteArtworks = User.settings.favorites.map( { (id) -> Artwork in
            return Artwork.getArtwork(id: id)!
        })
        
        favoritesTableView.reloadData()
    }
    
    func didPressDeleteButton(_ artworkId: Int) {
        // delete favorite in user settings
        User.settings.removeFavorite(favoriteId: artworkId)
        
        // reload the favorites list
        refreshData()
    }
}
