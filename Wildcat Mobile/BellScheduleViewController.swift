//
// BellScheduleViewController.swift
// Wildcat Mobile
//
// Created by Nick Winans on 1/30/2017
// Copyright © 2017 Centreville HS. All rights reserved.
//

import UIKit

class BellScheduleViewController: UITableViewController {
    //regular bell schedule, separated into 5 blocks and 4 lunches
    let regBlock1 = "1st/2nd period:		8:10 - 9:43"
    let regBlock2 = "PLUS:              9:49 - 10:14"
    let regBlock3 = "3rd/4th period:    10:20 - 11:52"
    let regBlock4 = "5th/6th period: 		11:58 - 2:01"
    let regBlock5 = "7th period: 				2:08 - 2:55"
  
    //2 hour early release block schedule, 4 blocks because no plus (and 4 lunches)
    let ereBlock1 = "look a bunny"
    let ereBlock2 = "(\   /)"
    let ereBlock3 = "(='.'=)"
    let ereBlock4 = "(') (')"
	
		//2 hour delay schedule, 4 blocks becuase no plus (and 4 lunches)
		let delBlock1 = "1st/2nd period:		10:10 - 11:09"
    let delBlock2 = "3rd/4th period:		11:15 - 12:14"
    let delBlock3 = "5th/6th period:		12:20 - 2:24"
    let delBlock4 = "7th period:				2:30 - 2:55"
		
		/*struct day {
				static let r = "regularBellSchedule"
				static let e = "earlyRelease"
				static let d = "2hourDelay"
				static let o = "1hourDelay"
		}*/
	
		
		
		override func viewDidLoad() {
				super.viewDidLoad()	
		}
	
		func magic(_ t: int) -> String {
				switch t{
						case 0: return regBlock1 + "\n" + regBlock2 + "\n" + regBlock3 + "\n" + regBlock4 + "\n" + regBlock5 //todo: add lunches
						default: return "yoooooooo congrats you've reached narnia"
				}
		}
	
		override func numberOfSections(in tableView: UITableView) -> Int {
			return 1
		}
	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
		
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "bell", for: indexPath as IndexPath) as! UITableViewCell
		
		let zoolanderz = magic(indexPath.row)
		
		cell.textView!.text = zoolanderz
		
		return cell
		
	}
		
}
