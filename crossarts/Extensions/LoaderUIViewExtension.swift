//
//  LoaderUIViewExtension.swift
//  crossarts
//
//  Created by Nico on 28/06/2019.
//  Copyright © 2019 Nico. All rights reserved.
//

import Foundation
import UIKit

/**
 Adds the ability to show a loader on an UIViewController
 
 Adds the following func:
 - showLoader
 - hideLoader
 
 **/
extension UIViewController {
    
    var loaderViewTag: Int { return 999999 }
    
    func showLoader(
        style: UIActivityIndicatorView.Style = .gray,
        location: CGPoint? = nil) {
        
        // defaults to `center`
        let loc = location ?? self.view.center

        // disable user interaction while loading is in progress
        self.view.isUserInteractionEnabled = false
        // UIApplication.shared.beginIgnoringInteractionEvents()
        
        // ensure the UI is updated from the main thread
        // in case this method is called from a closure
        DispatchQueue.main.async {
            // create view
            let loaderView = UIView(frame: self.view.bounds)
            loaderView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
            
            // add the tag so we can find the view in order to remove it later
            loaderView.tag = self.loaderViewTag
            
            // create the activity indicator
            let activityIndicator = UIActivityIndicatorView(style: style)
            
            // set the location
            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            
            // start animating and add the view
            activityIndicator.startAnimating()
            
            loaderView.addSubview(activityIndicator)
            self.view.addSubview(loaderView)
        }
    }
    
    func hideLoader() {
        // again, we need to ensure the UI is updated from the main thread!
        DispatchQueue.main.async {
            // here we find the `UIActivityIndicatorView` and remove it from the view
            if let loaderView = self.view.subviews.filter(
                { $0.tag == self.loaderViewTag }).first {
                // loaderViewTag.stopAnimating()
                loaderView.removeFromSuperview()
                self.view.isUserInteractionEnabled = true
            }
        }
    }
}
