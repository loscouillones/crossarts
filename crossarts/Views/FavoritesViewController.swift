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
    func didPressDeleteButton(_ artworkId: Int)
    func didPressImageButton(_ artworkId: Int)
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
    
    func didPressImageButton(_ artworkId: Int) {
        // open details page
        openArtworkDetail(artworkId)
    }
    
    func openArtworkDetail(_ artworkId: Int) {
        // first get storyboard ref
        let storyboard = UIStoryboard(name: "HomeAndDetails", bundle: nil)
        
        // then instanciate controller
        let viewController = storyboard.instantiateViewController(withIdentifier: "ArtDetailController") as! ArtDetailViewController
        
        viewController.artwork = Artwork.getArtwork(id: artworkId)
        
        self.tabBarController?.selectedIndex = 0
        
        let navigationController = self.tabBarController?.selectedViewController as! UINavigationController
        
        let currentViewController = navigationController.viewControllers.last
        
        if let detailsController = currentViewController as? ArtDetailViewController {
            // only push a new controller if we were not showing the same art before
            if detailsController.artwork?.id != artworkId {
                // set back button
                let backItem = UIBarButtonItem()
                backItem.title = detailsController.artwork?.title
                detailsController.navigationItem.backBarButtonItem = backItem
                navigationController.pushViewController(viewController, animated:true)
            }
        } else {
            let backItem = UIBarButtonItem()
            backItem.title = "Cross'Cards du jour"
            currentViewController?.navigationItem.backBarButtonItem = backItem
            // we came from home carrousel
            navigationController.pushViewController(viewController, animated:true)
        }
    }
}
