//
//  AboutViewController.swift
//  crossarts
//
//  Created by Nico on 02/07/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import UIKit
import Lottie


class AboutViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let animationView = AnimationView(name: "like-anim")

        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        animationView.center = self.view.center
        // animationView.contentMode = .scaleAspectFill

        view.addSubview(animationView)

        animationView.play(fromProgress: 0, toProgress: 0)
    }
    
    
    @IBAction func onButtonTap(_ sender: Any) {
        print("tap!")
    }
    
    @IBAction func onLikeButtonTap(_ sender: Any) {
        
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
