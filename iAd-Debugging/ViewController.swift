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
class ViewController: UIViewController {

    var bannerView: ADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        bannerView = appDelegate.bannerView
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

    override func viewWillAppear(animated: Bool) {
        if bannerView != nil {
            bannerView.hidden = true
        }
    }

    override func viewWillDisappear(animated: Bool) {
        if bannerView != nil {
            bannerView.hidden = false
        }
    }
}

