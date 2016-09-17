//
//  TeachersTableViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 9/6/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class TeachersTableViewController: UITableViewController {

	var mathTeachers:Array<String> = [
	"Beatty, Kathy",
	"Bonnell, Brittany",
	"Hwang, Renae Eunae",
	"Joyce, Masha E",
	"Kent, Elizabeth",
	"McCarthy, Megan M",
	"Mishin, Julia",
	"Mossholder, Steven C",
	"Nicholson, Marisa",
	"Noga, Matthew",
	"Person, Gordon L",
	"Post, Eric M",
	"Rigby, Susan E",
	"Rubin, Mary K",
	"Shanahan, Mary M",
	"Small, Oliver A",
	"Terninko, Miriam",
	"Wallace, Jessica K",
	"Williams, Jed C"]
	
	var scienceTeachers:Array<String> = [
	"Abrahams, Heather",
	"Banbury, Demby B",
	"Cash, Tammy",
	"Cole-Kleitz, Jean",
	"Fehr, Heather",
	"Fehr, Joe",
	"Jarvis, Neal",
	"Lee, Christina",
	"Malik, Maliha A",
	"McLaren, John D",
	"Neer, Michelle",
	"Reese, Susan T",
	"Rife, Melissa M",
	"Rock, Caitlin",
	"Saccomando, Ashley",
	"Shepard, Katherine",
	"Trahan, Ryley",
	"Touhy, Kevin",
	"Waterfall, Kathleen",
	"White, Lauren A",
	"Williams, David B"]
	
	var socialTeachers:Array<String> = [
	"Baird, Gary B",
	"Bausman, David",
	"Brown, Heidi",
	"Campbell, David C",
	"Christ, Tony",
	"Clark, Paige W",
	"Flanagin, Wiley S",
	"Golodolinski, Jacquelyn",
	"Gumersell, Bridget",
	"Hadden, Anita L",
	"Novak, Jim",
	"O'Rourke, John M",
	"Pillor, Michelle",
	"Powell, Jennifer T",
	"Radun, Joseph N",
	"Ritchey, Terri",
	"Ruffing, Catherine A",
	"Rutz, Jonathan E",
	"Smith, Catherine D",
	"Wisda, Martin J"]
	
	var englishTeachers:Array<String> = [
	"Berg, Jessica",
	"Bergel, Jennifer",
	"Borah, Brown",
	"Brown, Margot S",
	"D'Orazio, Marissa",
	"DuncanHudsbeth, Sharon D",
	"Filsinger, Jennifer",
	"Harar, Bethany",
	"Hughes, Alison",
	"Hwangpo, Jennie",
	"Kinsolving, Kathleen",
	"Lee, Megan C",
	"McIntosh, Christopher",
	"Metzler, Debra J",
	"Munson, Russell W",
	"Saunders, Karen",
	"Sweeney, Donna",
	"Wuerfel, Victoria"]
	
	var peTeachers:Array<String> = [
	"Andersen, Jon T",
	"Bates, Jessica",
	"Bigus, Geordie L",
	"Culver, Joshua",
	"Ferrick, Richard",
	"Findley, Scott",
	"Francis, Laramie",
	"Martino, Erin M",
	"Rozzoni, Anthony M",
	"Stobl, Katherin",
	"Williams, Emily"]
	
	var musicTeachers:Array<String> = [
	"Babcock, Lynne A",
	"Burke, Bill",
	"Hall, Melissa A",
	"Morrison, Alex"]
	
	var cteTeachers:Array<String> = [
	"Agrait, Pat",
	"Belsky, Cindy",
	"Celepia, Albana",
	"Dumont, Rhonda",
	"Love, Bridget",
	"Reid, Leah"]
	
	var artTeachers:Array<String> = [
	"Drinkwater, Kara M",
	"Killinger, Kris",
	"Marcaccio, Rory F",
	"Search Kurt, Katherine"]
	
	
	var emailDictionary: [String: String] = [String: String]()
	
	var previouslySelectedHeaderIndex: Int?
	var currentlySelectedHeaderIndex: Int?
	var currentlySelectedItemIndex: Int?
	
	let cells = SwiftyAccordionCells()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.setup()
		self.tableView.estimatedRowHeight = 45
		self.tableView.rowHeight = UITableViewAutomaticDimension
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		self.tableView.reloadData()
	}
	
	func setup() {
		self.cells.append(SwiftyAccordionCells.HeaderItem(value: "Mathematics"))
		
		for teacher in mathTeachers {
			self.cells.append(SwiftyAccordionCells.Item(value: teacher))
		}
		
		self.cells.append(SwiftyAccordionCells.HeaderItem(value: "Science"))
		
		for teacher in scienceTeachers {
			self.cells.append(SwiftyAccordionCells.Item(value: teacher))
		}
		
		self.cells.append(SwiftyAccordionCells.HeaderItem(value: "Social Studies"))
		
		for teacher in socialTeachers {
			self.cells.append(SwiftyAccordionCells.Item(value: teacher))
		}
		
		self.cells.append(SwiftyAccordionCells.HeaderItem(value: "English"))
		
		for teacher in englishTeachers {
			self.cells.append(SwiftyAccordionCells.Item(value: teacher))
		}
		
		self.cells.append(SwiftyAccordionCells.HeaderItem(value: "Physical Education"))
		
		for teacher in peTeachers {
			self.cells.append(SwiftyAccordionCells.Item(value: teacher))
		}
		
		self.cells.append(SwiftyAccordionCells.HeaderItem(value: "Music"))
		
		for teacher in musicTeachers {
			self.cells.append(SwiftyAccordionCells.Item(value: teacher))
		}
		
		self.cells.append(SwiftyAccordionCells.HeaderItem(value: "Career Technical Education"))
		
		for teacher in cteTeachers {
			self.cells.append(SwiftyAccordionCells.Item(value: teacher))
		}
		
		self.cells.append(SwiftyAccordionCells.HeaderItem(value: "Art"))
			
		for teacher in artTeachers {
			self.cells.append(SwiftyAccordionCells.Item(value: teacher))
		}
		
		
		emailDictionary["Beatty, Kathy"] = "KABeatty@fcps.edu"
		emailDictionary["Bonnell, Brittany"] = "blbonnell@fcps.edu"
		emailDictionary["Hwang, Renae Eunae"] = "rehwang@fcps.edu"
		emailDictionary["Joyce, Masha E"] = "MEJoyce@fcps.edu"
		emailDictionary["Kent, Elizabeth"] = "ekent1@fcps.edu"
		emailDictionary["McCarthy, Megan M"] = "MMMcCarthy@fcps.edu"
		emailDictionary["Mishin, Julia"] = "JMishin@fcps.edu"
		emailDictionary["Mossholder, Steven C"] = "SCMossholder@fcps.edu"
		emailDictionary["Nicholson, Marisa"] = "menicholson@fcps.edu"
		emailDictionary["Noga, Matthew"] = "mjnoga@fcps.edu"
		emailDictionary["Person, Gordon L"] = "GLPerson@fcps.edu"
		emailDictionary["Post, Eric M"] = "EMPost@fcps.edu"
		emailDictionary["Rigby, Susan E"] = "SERigby@fcps.edu"
		emailDictionary["Rubin, Mary K"] = "MKRubin@fcps.edu"
		emailDictionary["Shanahan, Mary M"] = "mmshanahan@fcps.edu"
		emailDictionary["Small, Oliver A"] = "OASmall@fcps.edu"
		emailDictionary["Terninko, Miriam"] = "msterninko@fcps.edu"
		emailDictionary["Wallace, Jessica K"] = "JKWallace@fcps.edu"
		emailDictionary["Williams, Jed C"] = "JCWilliams1@fcps.edu"
		
		emailDictionary["Abrahams, Heather"] = "haabrahams@fcps.edu"
		emailDictionary["Banbury, Demby B"] = "DBBanbury@fcps.edu"
		emailDictionary["Cash, Tammy"] = "tjcash@fcps.edu"
		emailDictionary["Cole-Kleitz, Jean"] = "jmcolesleitz@fcps.edu"
		emailDictionary["Fehr, Heather"] = "hlfehr@fcps.edu"
		emailDictionary["Fehr, Joe"] = "JJFehr@fcps.edu"
		emailDictionary["Jarvis, Neal"] = "JNJarvis@fcps.edu"
		emailDictionary["Lee, Christina"] = "clee2@fcps.edu"
		emailDictionary["Malik, Maliha A"] = "mamalik@fcps.edu"
		emailDictionary["McLaren, John D"] = "JCMcLaren@fcps.edu"
		emailDictionary["Neer, Michelle"] = "mlneer@fcps.edu"
		emailDictionary["Reese, Susan T"] = "STReese@fcps.edu"
		emailDictionary["Rife, Melissa M"] = "MMRife1@fcps.edu"
		emailDictionary["Rock, Caitlin"] = "cerock@fcps.edu"
		emailDictionary["Saccomando, Ashley"] = "ajsaccamando@fcps.edu"
		emailDictionary["Shepard, Katherine"] = "kshepard@fcps.edu"
		emailDictionary["Trahan, Ryley"] = "rjtrahan@fcps.edu"
		emailDictionary["Touhy, Kevin"] = "kftouhy@fcps.edu"
		emailDictionary["Waterfall, Kathleen"] = "kmwaterfall@fcps.edu"
		emailDictionary["White, Lauren A"] = "LAWhite1@fcps.edu"
		emailDictionary["Williams, David B"] = "DBWilliams@fcps.edu"
		
		emailDictionary["Baird, Gary B"] = "GBBaird@fcps.edu"
		emailDictionary["Bausman, David"] = "SDBausman@fcps.edu"
		emailDictionary["Brown, Heidi"] = "hfbrown@fcps.edu"
		emailDictionary["Campbell, David C"] = "DCCampbell@fcps.edu"
		emailDictionary["Christ, Tony"] = "eachrist1@fcps.edu"
		emailDictionary["Clark, Paige W"] = "PWClark@fcps.edu"
		emailDictionary["Flanagin, Wiley S"] = "WSFlanagin@fcps.edu"
		emailDictionary["Golodolinski, Jacquelyn"] = "jcgolodolins@fcps.edu"
		emailDictionary["Gumersell, Bridget"] = "bgumersell@fcps.edu"
		emailDictionary["Hadden, Anita L"] = "ALHadden@fcps.edu"
		emailDictionary["Novak, Jim"] = "jhnovak@fcps.edu"
		emailDictionary["O'Rourke, John M"] = "jmorourke@fcps.edu"
		emailDictionary["Pillor, Michelle"] = "MSPillor@fcps.edu"
		emailDictionary["Powell, Jennifer T"] = "JTPowell@fcps.edu"
		emailDictionary["Radun, Joseph N"] = "JNRadun@fcps.edu"
		emailDictionary["Ritchey, Terri"] = "TRitchey@fcps.edu"
		emailDictionary["Ruffing, Catherine A"] = "CARuffing@fcps.edu"
		emailDictionary["Rutz, Jonathan E"] = "JERutz@fcps.edu"
		emailDictionary["Smith, Catherine D"] = "CDSmith1@fcps.edu"
		emailDictionary["Wisda, Martin J"] = "mjwisad@fcps.edu"
		
		emailDictionary["Berg, Jessica"] = "jeberg@fcps.edu"
		emailDictionary["Bergel, Jennifer"] = "jkbergel@fcps.edu"
		emailDictionary["Borah, Brown"] = "wbborah@fcps.edu"
		emailDictionary["Brown, Margot S"] = "MSBrown2@fcps.edu"
		emailDictionary["D'Orazio, Marissa"] = "mcdorazio@fcps.edu"
		emailDictionary["DuncanHudsbeth, Sharon D"] = "SDDuncanHuds@fcps.edu"
		emailDictionary["Filsinger, Jennifer"] = "JLFilsinger@fcps.edu"
		emailDictionary["Harar, Bethany"] = "baharar@fcps.edu"
		emailDictionary["Hughes, Alison"] = "aghughes@fcps.edu"
		emailDictionary["Hwangpo, Jennie"] = "jkhwangpo@fcps.edu"
		emailDictionary["Kinsolving, Kathleen"] = "kskinsolving@fcps.edu"
		emailDictionary["Lee, Megan C"] = "MWLee@fcps.edu"
		emailDictionary["McIntosh, Christopher"] = "camcintosh@fcps.edu"
		emailDictionary["Metzler, Debra J"] = "djmetzler@fcps.edu"
		emailDictionary["Munson, Russell W"] = "RWMunsion@fcps.edu"
		emailDictionary["Saunders, Karen"] = "kbsaunders@fcps.edu"
		emailDictionary["Sweeney, Donna"] = "dlsweeney@fcps.edu"
		emailDictionary["Wuerfel, Victoria"] = "VKWuerfel@fcps.edu"
		
		emailDictionary["Andersen, Jon T"] = "JTAnderson@fcps.edu"
		emailDictionary["Bates, Jessica"] = "jmbates@fcps.edu"
		emailDictionary["Bigus, Geordie L"] = "GLBigus@fcps.edu"
		emailDictionary["Culver, Joshua"] = "JCulver@fcps.edu"
		emailDictionary["Ferrick, Richard"] = "REFerrick@fcps.edu"
		emailDictionary["Findley, Scott"] = "stfindley@fcps.edu"
		emailDictionary["Francis, Laramie"] = "lbfrancis@fcps.edu"
		emailDictionary["Martino, Erin M"] = "EMMartino@fcps.edu"
		emailDictionary["Rozzoni, Anthony M"] = "AMRozzoni@fcps.edu"
		emailDictionary["Stobl, Katherin"] = "klstrobl@fcps.edu"
		emailDictionary["Williams, Emily"] = "eawilliams@fcps.edu"
		
		emailDictionary["Babcock, Lynne A"] = "LLBabcock1@fcps.edu"
		emailDictionary["Burke, Bill"] = "WBBurke@fcps.edu"
		emailDictionary["Hall, Melissa A"] = "MAHall3@fcps.edu"
		emailDictionary["Morrison, Alex"] = "ammorrison1@fcps.edu"
		
		emailDictionary["Agrait, Pat"] = "plagrait@fcps.edu"
		emailDictionary["Belsky, Cindy"] = "cdbelsky@fcps.edu"
		emailDictionary["Celepia, Albana"] = "aacelepia@fcps.edu"
		emailDictionary["Dumont, Rhonda"] = "rkdumont@fcps.edu"
		emailDictionary["Love, Bridget"] = "bmlove@fcps.edu"
		emailDictionary["Reid, Leah"] = "lereid1@fcps.edu"
		
		emailDictionary["Drinkwater, Kara M"] = "KMDrinkwater@fcps.edu"
		emailDictionary["Killinger, Kris"] = "PKKillinger@fcps.edu"
		emailDictionary["Marcaccio, Rory F"] = "RMarcaccio@fcps.edu"
		emailDictionary["Search Kurt, Katherine"] = "kmsearchkurt@fcps.edu"
		
		
	}
	
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.cells.items.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let item = self.cells.items[indexPath.row]
		let value = item.value as? String
		
		if item as? SwiftyAccordionCells.HeaderItem == nil {
			/*let cell = tableView.dequeueReusableCellWithIdentifier("teachers", forIndexPath: indexPath) as! TeachersTableViewCell
			
			cell.teacher.text = value
			cell.email.text = "hello"//emailDictionary[value!]*/
			
			let cell = UITableViewCell(/*style: UITableViewCellStyle.Subtitle, reuseIdentifier: "teacherz"*/)
			cell.textLabel?.numberOfLines = 2
			cell.textLabel?.text = value! + "\n" + emailDictionary[value!]!
			cell.textLabel?.clipsToBounds = true
			return cell
		} else {
			let cell = UITableViewCell()
			cell.textLabel?.text = value
			cell.backgroundColor = UIColor.blackColor()
			cell.textLabel?.textColor = UIColor.whiteColor()
			cell.textLabel?.clipsToBounds = true
			cell.selectionStyle = UITableViewCellSelectionStyle.None
			return cell
		}
		
		
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		let item = self.cells.items[indexPath.row]
		
		if item is SwiftyAccordionCells.HeaderItem {
			return 60
		} else if item.isHidden {
			return 0
		} else {
			return UITableViewAutomaticDimension
		}
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let item = self.cells.items[indexPath.row]
		
		if item is SwiftyAccordionCells.HeaderItem {
			if self.currentlySelectedHeaderIndex == nil {
				self.currentlySelectedHeaderIndex = indexPath.row
			} else {
				self.previouslySelectedHeaderIndex = self.currentlySelectedHeaderIndex
				self.currentlySelectedHeaderIndex = indexPath.row
			}
			
			if let previouslySelectedHeaderIndex = self.previouslySelectedHeaderIndex {
				self.cells.collapse(previouslySelectedHeaderIndex)
			}
			
			if self.previouslySelectedHeaderIndex != self.currentlySelectedHeaderIndex {
				self.cells.expand(self.currentlySelectedHeaderIndex!)
			} else {
				self.currentlySelectedHeaderIndex = nil
				self.previouslySelectedHeaderIndex = nil
			}
			
			self.tableView.beginUpdates()
			self.tableView.endUpdates()
			
		} else {
			self.currentlySelectedItemIndex = indexPath.row
			var alert = UIAlertController.init(title: "What would you like to do?", message: "Would you like to copy this teacher's email, or start a new email to this teacher?", preferredStyle: UIAlertControllerStyle.ActionSheet)
			
			let copyAction = UIAlertAction.init(title: "Copy", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) in
				UIPasteboard.generalPasteboard().string = self.emailDictionary[item.value as! String]!
			})
			
			let sendAction = UIAlertAction.init(title: "Send an Email", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) in
				UIApplication.sharedApplication().openURL(NSURL(string: "mailto:" + self.emailDictionary[item.value as! String]!)!)
			})
			
			let cancelAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: { (UIAlertAction) in
				self.dismissViewControllerAnimated(true, completion: nil)
			})
			
			alert.addAction(copyAction)
			alert.addAction(sendAction)
			alert.addAction(cancelAction)
			self.presentViewController(alert, animated: true, completion: nil)
		}
	}
	
	
}
