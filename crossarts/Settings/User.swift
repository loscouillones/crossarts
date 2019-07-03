//
//  UserSettings.swift
//  crossarts
//
//  Created by Nico on 02/07/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import Foundation


class User {
    
    // favoritesId
    var favorites: [Int] = []
    // for each badge: obtained
    var badges: [Int] = [1, -1, -1, -1, -1, -1, -1, -1]
    // for each badge: number of views
    var badgeViews: [Int] = [0, 0, 0, 0, 0, 0, 0, 0]
    
    static let settings = User()

    func addFavorite(favoriteId: Int) {
        if !hasFavorite(favoriteId: favoriteId) {
            print("Adding favorite: \(favoriteId)")
            favorites.append(favoriteId)
            saveFavorites()
        } else {
            print("Already favorited: \(favoriteId)")
        }
    }
    
    func removeFavorite(favoriteId: Int) {
        if let index = favorites.firstIndex(where: { (favId) -> Bool in favId == favoriteId }) {
            print("Removing favorite: \(favoriteId)")
            favorites.remove(at: index)
            saveFavorites()
        } else {
            print("Cannot remove favorite: \(favoriteId)")
        }
    }
    
    func hasFavorite(favoriteId: Int) -> Bool {
        print("hasFavorite(\(favoriteId) -> \(favorites.contains(favoriteId)))")
        return favorites.contains(favoriteId)
    }
    
    func clearFavorites() {
        print("Clearing favorites")
        favorites.removeAll()
        saveFavorites()
    }
    
    func ready() {
        print("User: init settings")
        if UserDefaults.standard.value(forKey: "version") != nil {
            print("loading settings")
            // TODO: change version if saved one is lower than current app version
            // load settings
            load()
        } else {
            print("Saving default Settings")
            // save default settings
            save()
            let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
            UserDefaults.standard.set(version, forKey: "version")
        }
        
    }
    
    func load() {
        let favorites = UserDefaults.standard.value(forKey: "favorites") as? [Int]
        let badges = UserDefaults.standard.value(forKey: "badges") as? [Int]
        let badgeViews = UserDefaults.standard.value(forKey: "badgeViews") as? [Int]
        if favorites != nil && badges != nil && badgeViews != nil {
            print("loaded settings")
            print("favorites", favorites!)
            print("badges", badges!)
            print("badgeViews", badgeViews!)
            self.favorites = favorites!
            self.badges = badges!
            self.badgeViews = badgeViews!
        } else {
            print("Error retrieving userDefaults")
        }
    }
    
    func save() {
        saveFavorites()
        saveBadges()
        saveBadgeViews()
    }
    
    private func saveFavorites() {
        UserDefaults.standard.set(favorites, forKey: "favorites")
    }
    
    private func saveBadges() {
        UserDefaults.standard.set(badges, forKey: "badges")
    }
    
    private func saveBadgeViews() {
        UserDefaults.standard.set(badgeViews, forKey: "badgeViews")
    }
    
//    static func getNameAndAddress()-> Model {
//        return Model((UserDefaults.standard.value(forKey: userSessionKey) as? [String: String]) ?? [:])
//    }
    
    func clearUserData() {
        print("Clearing UserData")
        UserDefaults.standard.removeObject(forKey: "favorites")
        UserDefaults.standard.removeObject(forKey: "badges")
        UserDefaults.standard.removeObject(forKey: "badgeViews")
        UserDefaults.standard.removeObject(forKey: "version")
        // UserDefaults.standard.removeObject(forKey: userSessionKey)
    }
}
