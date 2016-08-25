//
//  ClubsViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 8/25/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit
import FoldingCell

class ClubsViewController: UITableViewController {
	
	let kCloseCellHeight: CGFloat = 60
	let kOpenCellHeight: CGFloat = 130
	
	var cellHeights = [CGFloat]()
	
	let kRowsCount = 10
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		createCellHeightsArray()
	}
	
	// MARK: configure
	func createCellHeightsArray() {
		for _ in 0...kRowsCount {
			cellHeights.append(kCloseCellHeight)
		}
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return cellHeights[indexPath.row]
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("FoldingCell", forIndexPath: indexPath)
		
		return cell
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let cell = tableView.cellForRowAtIndexPath(indexPath) as! FoldingCell
		
		var duration = 0.0
		if cellHeights[indexPath.row] == kCloseCellHeight { // open cell
			cellHeights[indexPath.row] = kOpenCellHeight
			cell.selectedAnimation(true, animated: true, completion: nil)
			duration = 0.5
		} else {// close cell
			cellHeights[indexPath.row] = kCloseCellHeight
			cell.selectedAnimation(false, animated: true, completion: nil)
			duration = 0.8
		}
		
		UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
			tableView.beginUpdates()
			tableView.endUpdates()
			}, completion: nil)
	}
	
	override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
		
		guard case let cell as ClubsCell = cell else {
			return
		}
		
		if cellHeights[indexPath.row] == kCloseCellHeight {
			cell.selectedAnimation(false, animated: false, completion:nil)
		} else {
			cell.selectedAnimation(true, animated: false, completion: nil)
		}
	}

}
