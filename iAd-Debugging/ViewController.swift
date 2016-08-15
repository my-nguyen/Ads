//
//  ViewController.swift
//  iAd-Debugging
//
//  Created by My Nguyen on 8/14/16.
//  Copyright © 2016 My Nguyen. All rights reserved.
//

import UIKit
import iAd

// this class conforms to ADBannerViewDelegate in order to set bannerView.delegate to the view controller
class ViewController: UIViewController, ADBannerViewDelegate {

    var bannerView: ADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        bannerView = ADBannerView(adType: .Banner)
        // the translatesAutoresizingMaskIntoConstraints property is to facilitate setting Auto Layout constraints
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        // set the view controller as the delegate of the banner view so it will receive
        // its load and fail messages
        bannerView.delegate = self
        bannerView.hidden = true
        view.addSubview(bannerView)

        let viewsDictionary = ["bannerView": bannerView]

        // set the iAd banner to fill the full width of the screen and align to the bottom
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[bannerView]|", options: [], metrics: nil, views: viewsDictionary))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[bannerView]|", options: [], metrics: nil, views: viewsDictionary))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // this method is triggered when an ad is received
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        bannerView.hidden = false
    }

    // this method is triggered when something went wrong
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        bannerView.hidden = true
    }
}

