//
//  ViewController.swift
//  crossarts
//
//  Created by Nico on 28/06/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource {

    var homeArts = [Artwork(id: 1,
                        landscapeUrl: "lanscape1",
                        portraitUrl: "portrait1",
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
                            description: "desc3",
                            title: "title3",
                            trivia: "trivia3",
                            related: [],
                            categoryId: 2,
                            tags: [],
                            date: Date())]
//        Art(image: #imageLiteral(resourceName: "joconde"), title: "La Joconde", trivia: "Blablahblah"),
//        Art(image: #imageLiteral(resourceName: "herbe"), title: "Yo man!", trivia: "Blablahblah 99")]
    
    @IBOutlet weak var artsCollectionView: UICollectionView!
    
    func testLoader() {
        showLoader()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            // Code you want to be delayed
            self.hideLoader()
        }
    }
    
    func prepareCollectionView() {
        artsCollectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testLoader()
        prepareCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // try to select the second one
        artsCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: false)
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeArts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeArtCollectionViewCell", for: indexPath) as! HomeArtCollectionViewCell
        let art = homeArts[indexPath.item]
        cell.art = art

        return cell
    }
}
