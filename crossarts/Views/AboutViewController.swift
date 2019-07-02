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

    @IBOutlet weak var likeButton: LikeButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let animationView = AnimationView(name: "like-anim")
//
//        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
//        animationView.center = self.view.center
//        animationView.contentMode = .scaleAspectFill
//
//        view.addSubview(animationView)
//
//        animationView.play(fromProgress: 0, toProgress: 0)
    }
    

    @IBAction func onLike(_ sender: Any) {
        // likeButton.isLiked = true
        likeButton.doLike()
    }
    
    @IBAction func onUnLike(_ sender: Any) {
        likeButton.isLiked = false
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
