//
//  PlusViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 10/4/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class PlusViewController: UIViewController, UIScrollViewDelegate {

	//get the scrollView and imageView from the storyboard
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var imageView: UIImageView!
	
	//default function called when the view is about to load
    override func viewDidLoad() {
        super.viewDidLoad()

	//set the max the scroll view will zoom to to 6x
	self.scrollView.minimumZoomScale = 1.0
	self.scrollView.maximumZoomScale = 6.0	
    }   

    //function required by UIScrollViewDelegate - asks for the view to be zoomed in on, we give it the imageView
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
	return self.imageView
    }

}
