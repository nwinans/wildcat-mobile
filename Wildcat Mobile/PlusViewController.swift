//
//  PlusViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 10/4/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class PlusViewController: UIViewController, UIScrollViewDelegate {

	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var imageView: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.scrollView.minimumZoomScale = 1.0
		self.scrollView.maximumZoomScale = 6.0
		
		
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
		return self.imageView
	}

}
