//
//  ViewController.swift
//  crossarts
//
//  Created by Nico on 28/06/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showLoader()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            // Code you want to be delayed
            self.hideLoader()
        }
    }


}

