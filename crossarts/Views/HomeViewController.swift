//
//  ViewController.swift
//  crossarts
//
//  Created by Nico on 28/06/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController, UICollectionViewDataSource, UIScrollViewDelegate, UICollectionViewDelegate {
    var selectedCell = -1
    var previousSelectedCell = -1
    let HOME_CELLS = 3
    let jasonURL = "https://www.souljax.com/crossarts/artworks.json"
//    var homeArts = [Artwork(id: 1,
//                        landscapeUrl: "lanscape1",
//                        portraitUrl: "portrait1",
//                        thumbUrl: "thumb1",
//                        description: "desc1",
//                        title: "title1",
//                        trivia: "trivia1",
//                        related: [],
//                        categoryId: 1,
//                        tags: [],
//                        date: Date()),
//                    Artwork(id: 2,
//                            landscapeUrl: "lanscape2",
//                            portraitUrl: "portrait2",
//                            thumbUrl: "thumb2",
//                            description: "desc2",
//                            title: "title2",
//                            trivia: "trivia2",
//                            related: [],
//                            categoryId: 2,
//                            tags: [],
//                            date: Date()),
//                    Artwork(id: 3,
//                            landscapeUrl: "lanscape3",
//                            portraitUrl: "portrait3",
//                            thumbUrl: "thumb3",
//                            description: "desc3",
//                            title: "title3",
//                            trivia: "trivia3",
//                            related: [],
//                            categoryId: 2,
//                            tags: [],
//                            date: Date())]

    let cellScale: CGFloat = 0.8
    
    
    /////////REQUEST/////////
    func sendRequest(toUrl requestUrl: String) {
        // 1. Il nous faut créer une session
        // URLSession.shared est une session déjà créé qui ne nécessite pas de configuration
        let session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = 3
        
        // 2. Création d'une instance d'URL
        let url = URL(string: requestUrl)!
        
        // 3. Création d'une task utilisant cette session pour appeler l'URL demandée
        let task = session.dataTask(with: url,
                                    completionHandler: { data, response, error in
                                        
                                        if error != nil {
                                            print("Error during request: \(error)")
                                            return
                                        }
                                        
                                        // On verifie que la réponse est dans les 2xx (pas d'erreur)
                                        guard let httpResponse = response as? HTTPURLResponse,
                                            (200...299).contains(httpResponse.statusCode) else {
                                                if let httpResponse = response as? HTTPURLResponse {
                                                    print("Error calling \(self.jasonURL), error code: \(httpResponse.statusCode)")
                                                } else {
                                                    print("Error calling \(self.jasonURL), no error code")
                                                }
                                                
                                                return
                                        }
                                        
                                        // Vérification du mimetype (optionnel)
                                        guard let mime = response?.mimeType, mime == "application/json" else {
                                            print("Wrong MIME type!")
                                            return
                                        }
                                        
                                        // Enfin: décodage de la réponse
                                        let text = String(data: data!, encoding: String.Encoding.utf8)
                                        print("result REQUEST: \n\n")
                                        print(text)
        })
        
        // Ici la requête a juste était préparée, mais pas envoyée
        // Cet appel permet de lancer la tâche
        task.resume()
        
    }
    /////////AND-REQUEST/////////
    
    @IBOutlet weak var artsCollectionView: UICollectionView!
    
    func testLoader() {
        showLoader()
        
        // jsonLoader()
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // Code you want to be delayed
            self.hideLoader()
        }
    }
    
    func loadHomeData() {
        showLoader()
        jsonLoader()
        hideLoader()
    }

   /* let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    decoder.dateDecodingStrategy = .secondsSince1970
    //let launch = try decoder.decode(Launch.self, from: jsonData)
    */
    
    func jsonLoader() {
        
        
        print("\t JSONLOADER")
        
        guard let path = Bundle.main.path(forResource: "artworks", ofType: "json") else {
            print("ERROR getting json file")
            return }
        
        let url = URL(fileURLWithPath: path)
        print("url = [\(url)]")
        
        do {
            let data = try Data(contentsOf: url)
            //print(data)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let result = try
                decoder.decode(Artwork.JsonResponse.self, from: data)
            
            //print(result)
            
            Artwork.artworks = result.artworks
            
            // print(homeArts)
            
            
        } catch  {
            print("!!!! JSONloader - error : \n \(error)")
            
        }
        
        
    }
    
    
    func prepareCollectionView() {
        artsCollectionView.dataSource = self
        artsCollectionView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Arts"
        // navigationItem.title = "navItem"
        loadHomeData()
        // Do any additional setup after loading the view.
        // **testLoader()
        
        prepareCollectionView()
        
//        artsCollectionView.layer.borderColor = UIColor.red.cgColor
//        artsCollectionView.layer.borderWidth = 1.0
        calcCellSize()
    }
    
    func calcCellSize() {
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height * cellScale)

        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = artsCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        artsCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

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
            cell.layer.opacity = selectedCell == indexPath.row ? 1 : 0.2
        }
        
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.artsCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthWithPadding = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthWithPadding
        let roundedIndex = round(index)
        offset = CGPoint(x: roundedIndex * cellWidthWithPadding - scrollView.contentInset.left, y: scrollView.contentInset.top)
        
        targetContentOffset.pointee = offset
        
        // updateCellsOpacity()
        
        setSelected(Int(roundedIndex))
    }
    
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
        // find a way to push this to the viewcontroller ?
        let artworkId = Artwork.artworks[selectedCell]
//        let viewController = ArtDetailViewController(nibName: "ArtDetailViewController", bundle: nil)
//        self.navigationController?.pushViewController(viewController, animated: true)
        performSegue(withIdentifier: "artDetail", sender: nil)
    }
}
