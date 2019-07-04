//
//  ArtDetailViewController.swift
//  crossarts
//
//  Created by Nico on 01/07/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import UIKit

class ArtDetailViewController: UIViewController {
    var artwork:Artwork?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "detail"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
