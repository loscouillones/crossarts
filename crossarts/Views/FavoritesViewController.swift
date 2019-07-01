//
//  FavoritesViewController.swift
//  crossarts
//
//  Created by Florent Heyraud on 01/07/2019.
//  Copyright © 2019 Nico. All rights reserved.
//
import UIKit
import Foundation

class FavoritesViewController: UIViewController, UICollectionViewDataSource {
    
    
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
    
    @IBOutlet weak var favoritesListView: UITableView!
    
    func prepareCollectionView() {
        favoritesListView.dataSource = self as! UITableViewDataSource
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionViewCell", for: indexPath) as! FavoritesCollectionViewCell
        let favorite = favorites[indexPath.item]
        cell.favorite = favorite
        
        return cell
    }
}
