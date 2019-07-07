//
//  ViewController.swift
//  crossarts
//
//  Created by Nico on 28/06/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController, UICollectionViewDataSource, UIScrollViewDelegate, UICollectionViewDelegate {
    @IBOutlet weak var artsCollectionView: UICollectionView!
    
    var selectedCell = -1
    var previousSelectedCell = -1
    // number of cells to show in the carrousel
    let HOME_CELLS = 3
    // scaled size of the cells
    let CELL_SCALE: CGFloat = 0.8
    // sibbling's opacity
    let SIBBLING_OPACITY: Float = 0.2
    
    func loadHomeData() {
        showLoader()
        loadLocalJSON()
        hideLoader()
    }
    
    func loadLocalJSON() {
        print("\t JSONLOADER")
        
        guard let path = Bundle.main.path(forResource: "artworks", ofType: "json") else {
            print("ERROR getting json file")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        print("url = [\(url)]")
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            Artwork.artworks = try decoder.decode((Array<Artwork>).self, from: data)
        } catch  {
            print("Error while loading/parsing local artworks JSON: \n \(error)")
        }
    }
    
    
    func prepareCollectionView() {
        artsCollectionView.dataSource = self
        artsCollectionView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        title = "Arts"
        // navigationItem.title = "navItem"
        loadHomeData()
        
        prepareCollectionView()
        
        calcCellSize()
    }
    
    func calcCellSize() {
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * CELL_SCALE)
        let cellHeight = floor(screenSize.height * CELL_SCALE)

        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = artsCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        artsCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // center the scrolling on the middle cell
        setSelected(1, true)
    }
    
    func setSelected(_ index: Int, _ scrollToItem: Bool = false) {
        print("setSelected(\(index))")
        selectedCell = index
        
        // if needed scroll to specified cell
        if scrollToItem {
            let indexPath = IndexPath(item: index, section: 0)
            artsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        }
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HOME_CELLS
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeArtCollectionViewCell", for: indexPath) as! HomeArtCollectionViewCell
        let art = Artwork.artworks[indexPath.item]
        cell.art = art

        if (selectedCell > -1) {
            cell.layer.opacity = selectedCell == indexPath.row ? 1 : SIBBLING_OPACITY
        }
        
        return cell
    }

    // automatically position the scroll on the closer cell when scrollView will
    // end dragging
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.artsCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthWithPadding = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthWithPadding
        let roundedIndex = round(index)
        offset = CGPoint(x: roundedIndex * cellWidthWithPadding - scrollView.contentInset.left, y: scrollView.contentInset.top)
        
        targetContentOffset.pointee = offset
        
        setSelected(Int(roundedIndex))
    }
    
    // update each cell's opacity depending on its position relative to the selected cell
    func updateCellsOpacity() {
        for i in 0..<Artwork.artworks.count {
            if let cell = artsCollectionView.cellForItem(at: IndexPath(row: i, section: 0)) as? HomeArtCollectionViewCell {
                cell.layer.removeAllAnimations()
                let targetOpacity = selectedCell == i ? 1.0 : 0.2
                print("animate(\(i), \(targetOpacity))")
                UIView.animate(withDuration: selectedCell == i ? 0.2 : 0.6, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                    cell.layer.opacity = Float(targetOpacity)
                })
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("didEndDecelerating")
        updateCellsOpacity()
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("willBeginDecelerating")
        updateCellsOpacity()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // check that clicked item is the selected one: if it is, call the details controller
        if indexPath.row == selectedCell {
            print("Need to open details for the selected cell")
            pushNextViewController()
        }
    }
    
    func pushNextViewController() {
        performSegue(withIdentifier: "artDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "artDetail":
            let controller = segue.destination as! ArtDetailViewController
            controller.artwork = Artwork.artworks[selectedCell]
            
        default:
            print("defaultSegue")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // update like button status in case it has been updated outside of this controller
        for i in 0..<Artwork.artworks.count {
            if let cell = artsCollectionView.cellForItem(at: IndexPath(row: i, section: 0)) as? HomeArtCollectionViewCell {
                cell.updateLikeStatus()
            }
        }
    }
}
