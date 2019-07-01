//
//  FavoritesViewController.swift
//  crossarts
//
//  Created by Florent Heyraud on 01/07/2019.
//  Copyright © 2019 Nico. All rights reserved.
//
import UIKit
import Foundation

class FavoritesViewController: UIViewController, UITableViewDataSource {

    
    var favorites = [
        Favorite(
            favoriteID: 01
                    ),
        Favorite(
            favoriteID: 02
                    ),
        Favorite(
            favoriteID: 03
        )]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withReuseIdentifier: "FavoritesListViewCell", for: indexPath) as! FavoritesListViewCell
        let fav = favorites[indexPath.item]
        cell.fav = fav
        
        return cell
    }
    
}
