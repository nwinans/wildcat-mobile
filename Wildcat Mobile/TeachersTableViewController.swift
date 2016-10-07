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
	"Ahmad, Mirza",
	"Beatty, Kathy",
	"Hiemstra, Maryam",
	"Hwang, Renae Eunae",
	"Joyce, Masha",
	"Kent, Elizabeth",
	"McCarthy, Megan",
	"Mishin, Julia",
	"Mossholder, Steven",
	"Nicholson, Marisa",
	"Noga, Matthew",
	"Person, Gordon",
	"Post, Eric",
	"Rigby, Susan",
	"Rubin, Mary",
	"Shanahan, Mary",
	"Small, Oliver",
	"Terninko, Miriam",
	"Wallace, Jessica",
	"Williams, Jed"]
	
	var scienceTeachers:Array<String> = [
	"Abrahams, Heather",
	"Banbury, Demby",
	"Cash, Tammy",
	"Cole-Kleitz, Jean",
	"Fehr, Heather",
	"Fehr, Joe",
	"Hong, Joyce",
	"Jarvis, Neal",
	"Lee, Christina",
	"Malik, Maliha",
	"McLaren, John",
	"Neer, Michelle",
	"Rock, Caitlin",
	"Saccomando, Ashley",
	"Touhy, Kevin",
	"Waterfall, Kathleen",
	"Wells, Ginger",
	"Williams, David"]
	
	var socialTeachers:Array<String> = [
	"Baird, Gary",
	"Brown, Heidi",
	"Campbell, David",
	"Clark, Paige",
	"Golodolinski, Jacquelyn",
	"Hadden, Anita",
	"Holloway, Tara",
	"Karsner, Kevin",
	"Novak, Jim",
	"O'Rourke, John",
	"Pillor, Michelle",
	"Powell, Jennifer",
	"Radun, Joseph",
	"Richardson, Ryan",
	"Rigby, Meredith",
	"Ritchey, Terri",
	"Ruffing, Catherine",
	"Rutz, Jonathan",
	"Saunders, Karen",
	"Wisda, Martin"]
	
	var englishTeachers:Array<String> = [
	"Arnold, Tammie",
	"Balen, Alison",
	"Berg, Jessica",
	"Borah, Brown",
	"Brown, Margot",
	"DuncanHudsbeth, Sharon",
	"Filsinger, Jennifer",
	"Hughes, Alison",
	"Hwangpo, Jennie",
	"Kinsolving, Kathleen",
	"Lee, Megan",
	"Marley, Nick",
	"Metzler, Debra",
	"Munson, Russell",
	"Robinson, Samantha",
	"Sweeney, Donna",
	"Wuerfel, Victoria"]
	
	var peTeachers:Array<String> = [
	"Andersen, Jon",
	"Bigus, Geordie",
	"Culver, Joshua",
	"Ferrick, Richard",
	"Findley, Scott",
	"Francis, Laramie",
	"Martino, Erin",
	"Rozzoni, Anthony",
	"Sholders, Andrea",
	"Williams, Emily"]
	
	var musicTeachers:Array<String> = [
	"Babcock, Lynne",
	"Burke, Bill",
	"Hall, Melissa",
	"Morrison, Alex"]
	
	var cteTeachers:Array<String> = [
	"Agrait, Pat",
	"Bedford, Yvette",
	"Belsky, Cindy",
	"Carfang, Michael",
	"Celepia, Albana",
	"McDermott, Michael",
	"Scott, Sean"]
	
	var artTeachers:Array<String> = [
	"Drinkwater, Kara",
	"Killinger, Kris",
	"Search Kurt, Katherine"]
	
	var worldLanguagesTeachers:Array<String> = [
	"Andros, Christina",
	"Fasick, Elise",
	"Haber, Barbara",
	"Lott, Antonia",
	"Martin, Judith",
	"Mayhew, Katie",
	"Rife, Melissa",
	"Taboada, Marina",
	"Turpin, Sophie",
	"Yu, Patricia"]
	
	var esolTeachers:Array<String> = [
	"Akpati, Rose",
	"DeBose, Claudia",
	"Langstein, Hanna",
	"Lewis, Terry",
	"Mazan, Allen",
	"Nave, Amy",
	"Singh, Anita",
	"Williamson Theil, Robin"]
	
	var counselorTeachers:Array<String> = [
	"Chace, Anne-Marie",
	"DeHaven, Sinitra",
	"Doss, Dana",
	"Foussekis, Katherine",
	"Koo, Autumn",
	"Mehaffey, Linda",
	"No, Jean",
	"Schneider, Nancy",
	"Thompson, Donna",
	"Vasquez, Jimmy"]
	
	var otherTeachers:Array<String> = [
	"Hudson, Mike",
	"Miller, Noel",
	"Pevner, Sarah",
	"Rose, Lyman",
	"Stamper, Kara"]
	
	
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
	
		self.cells.append(SwiftyAccordionCells.HeaderItem(value: "World Languages"))
		for teacher in worldLanguagesTeachers {
			self.cells.append(SwiftyAccordionCells.Item(value:teacher))
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
		
		self.cells.append(SwiftyAccordionCells.HeaderItem(value: "ESOL"))
		for teacher in esolTeachers {
			self.cells.append(SwiftyAccordionCells.Item(value: teacher))
		}
		
		self.cells.append(SwiftyAccordionCells.HeaderItem(value: "Counselor"))
		for teacher in counselorTeachers {
			self.cells.append(SwiftyAccordionCells.Item(value: teacher))
		}
		
		self.cells.append(SwiftyAccordionCells.HeaderItem(value: "Other"))
		for teacher in otherTeachers {
			self.cells.append(SwiftyAccordionCells.Item(value: teacher))
		}
		
		//EMAILS
		//Math Teachers
		emailDictionary["Ahmad, Mirza"] = "msahmad@fcps.edu"
		emailDictionary["Beatty, Kathy"] = "KABeatty@fcps.edu"
		emailDictionary["Hiemstra, Maryam"] = "MHHiemstra@fcps.edu"
		emailDictionary["Hwang, Renae Eunae"] = "rehwang@fcps.edu"
		emailDictionary["Joyce, Masha"] = "MEJoyce@fcps.edu"
		emailDictionary["Kent, Elizabeth"] = "ekent1@fcps.edu"
		emailDictionary["McCarthy, Megan"] = "MMMcCarthy@fcps.edu"
		emailDictionary["Mishin, Julia"] = "JMishin@fcps.edu"
		emailDictionary["Mossholder, Steven"] = "SCMossholder@fcps.edu"
		emailDictionary["Nicholson, Marisa"] = "menicholson@fcps.edu"
		emailDictionary["Noga, Matthew"] = "mjnoga@fcps.edu"
		emailDictionary["Person, Gordon"] = "GLPerson@fcps.edu"
		emailDictionary["Post, Eric"] = "EMPost@fcps.edu"
		emailDictionary["Rigby, Susan"] = "SERigby@fcps.edu"
		emailDictionary["Rubin, Mary"] = "MKRubin@fcps.edu"
		emailDictionary["Shanahan, Mary"] = "mmshanahan@fcps.edu"
		emailDictionary["Small, Oliver"] = "OASmall@fcps.edu"
		emailDictionary["Terninko, Miriam"] = "msterninko@fcps.edu"
		emailDictionary["Wallace, Jessica"] = "JKWallace@fcps.edu"
		emailDictionary["Williams, Jed"] = "JCWilliams1@fcps.edu"
		
		//Science Teachers
		emailDictionary["Abrahams, Heather"] = "haabrahams@fcps.edu"
		emailDictionary["Banbury, Demby"] = "DBBanbury@fcps.edu"
		emailDictionary["Cash, Tammy"] = "tjcash@fcps.edu"
		emailDictionary["Cole-Kleitz, Jean"] = "jmcolesleitz@fcps.edu"
		emailDictionary["Fehr, Heather"] = "hlfehr@fcps.edu"
		emailDictionary["Fehr, Joe"] = "JJFehr@fcps.edu"
		emailDictionary["Hong, Joyce"] = "jhong@fcps.edu"
		emailDictionary["Jarvis, Neal"] = "JNJarvis@fcps.edu"
		emailDictionary["Lee, Christina"] = "clee2@fcps.edu"
		emailDictionary["Malik, Maliha"] = "mamalik@fcps.edu"
		emailDictionary["McLaren, John"] = "JCMcLaren@fcps.edu"
		emailDictionary["Neer, Michelle"] = "mlneer@fcps.edu"
		emailDictionary["Rock, Caitlin"] = "cerock@fcps.edu"
		emailDictionary["Saccomando, Ashley"] = "ajsaccamando@fcps.edu"
		emailDictionary["Touhy, Kevin"] = "kftouhy@fcps.edu"
		emailDictionary["Waterfall, Kathleen"] = "kmwaterfall@fcps.edu"
		emailDictionary["Wells, Ginger"] = "vawells@fcps.edu"
		emailDictionary["Williams, David"] = "DBWilliams@fcps.edu"
		
		//Social Studies Teachers
		emailDictionary["Baird, Gary"] = "GBBaird@fcps.edu"
		emailDictionary["Brown, Heidi"] = "hfbrown@fcps.edu"
		emailDictionary["Campbell, David"] = "DCCampbell@fcps.edu"
		emailDictionary["Clark, Paige"] = "PWClark@fcps.edu"
		emailDictionary["Golodolinski, Jacquelyn"] = "jcgolodolins@fcps.edu"
		emailDictionary["Hadden, Anita"] = "ALHadden@fcps.edu"
		emailDictionary["Holloway, Tara"] = "tmholloway@fcps.edu"
		emailDictionary["Karsner, Kevin"] = "kkarsner@fcps.edu"
		emailDictionary["Novak, Jim"] = "jhnovak@fcps.edu"
		emailDictionary["O'Rourke, John"] = "jmorourke@fcps.edu"
		emailDictionary["Pillor, Michelle"] = "MSPillor@fcps.edu"
		emailDictionary["Powell, Jennifer"] = "JTPowell@fcps.edu"
		emailDictionary["Radun, Joseph"] = "JNRadun@fcps.edu"
		emailDictionary["Richardson, Ryan"] = "rdrichardso1@fcps.edu"
		emailDictionary["Rigby, Meredith"] = "mrrigby@fcps.edu"
		emailDictionary["Ritchey, Terri"] = "TRitchey@fcps.edu"
		emailDictionary["Ruffing, Catherine"] = "CARuffing@fcps.edu"
		emailDictionary["Rutz, Jonathan"] = "JERutz@fcps.edu"
		emailDictionary["Saunders, Karen"] = "kbsaunders@fcps.edu"
		emailDictionary["Wisda, Martin"] = "mjwisda@fcps.edu"
		
		//English Teachers
		emailDictionary["Arnold, Tammie"] = "TSArnold@fcps.edu"
		emailDictionary["Balen, Alison"] = "aabalen@fcps.edu"
		emailDictionary["Berg, Jessica"] = "jeberg@fcps.edu"
		emailDictionary["Borah, Brown"] = "wbborah@fcps.edu"
		emailDictionary["Brown, Margot"] = "MSBrown2@fcps.edu"
		emailDictionary["DuncanHudsbeth, Sharon"] = "SDDuncanHuds@fcps.edu"
		emailDictionary["Filsinger, Jennifer"] = "JLFilsinger@fcps.edu"
		emailDictionary["Hughes, Alison"] = "aghughes@fcps.edu"
		emailDictionary["Hwangpo, Jennie"] = "jkhwangpo@fcps.edu"
		emailDictionary["Kinsolving, Kathleen"] = "kskinsolving@fcps.edu"
		emailDictionary["Lague, Michelle"] = "mlague@fcps.edu"
		emailDictionary["Lee, Megan"] = "MWLee@fcps.edu"
		emailDictionary["Marley, Nick"] = "rnmarley@fcps.edu"
		emailDictionary["Metzler, Debra"] = "djmetzler@fcps.edu"
		emailDictionary["Munson, Russell"] = "RWMunsion@fcps.edu"
		emailDictionary["Robinson, Samantha"] = "srobinson@fcps.edu"
		emailDictionary["Sweeney, Donna"] = "dlsweeney@fcps.edu"
		emailDictionary["Wuerfel, Victoria"] = "VKWuerfel@fcps.edu"
		
		//PE Teachers
		emailDictionary["Andersen, Jon"] = "JTAnderson@fcps.edu"
		emailDictionary["Bigus, Geordie"] = "GLBigus@fcps.edu"
		emailDictionary["Culver, Joshua"] = "JCulver@fcps.edu"
		emailDictionary["Ferrick, Richard"] = "REFerrick@fcps.edu"
		emailDictionary["Findley, Scott"] = "stfindley@fcps.edu"
		emailDictionary["Francis, Laramie"] = "lbfrancis@fcps.edu"
		emailDictionary["Martino, Erin"] = "EMMartino@fcps.edu"
		emailDictionary["Rozzoni, Anthony"] = "AMRozzoni@fcps.edu"
		emailDictionary["Sholders, Andrea"] = "klstrobl@fcps.edu"
		emailDictionary["Williams, Emily"] = "eawilliams@fcps.edu"
		
		//Music Teachers
		emailDictionary["Babcock, Lynne"] = "LLBabcock1@fcps.edu"
		emailDictionary["Burke, Bill"] = "WBBurke@fcps.edu"
		emailDictionary["Hall, Melissa"] = "MAHall3@fcps.edu"
		emailDictionary["Morrison, Alex"] = "ammorrison1@fcps.edu"
		
		//CTE Teachers
		emailDictionary["Agrait, Pat"] = "plagrait@fcps.edu"
		emailDictionary["Bedford, Yvette"] = "ybedford@fcps.edu"
		emailDictionary["Belsky, Cindy"] = "cdbelsky@fcps.edu"
		emailDictionary["Carfang, Michael"] = "mcarfang@fcps.edu"
		emailDictionary["Celepia, Albana"] = "aacelepia@fcps.edu"
		emailDictionary["McDermott, Michael"] = "mamcdermott@fcps.edu"
		emailDictionary["Scott, Sean"] = "scscott@fcps.edu"
		
		//Art Teachers
		emailDictionary["Drinkwater, Kara"] = "KMDrinkwater@fcps.edu"
		emailDictionary["Killinger, Kris"] = "PKKillinger@fcps.edu"
		emailDictionary["Search Kurt, Katherine"] = "kmsearchkurt@fcps.edu"
		
		//ESOL Teachers
		emailDictionary["Akpati, Rose"] = "rnakpati@fcps.edu"
		emailDictionary["DeBose, Claudia"] = "cddebose@fcps.edu"
		emailDictionary["Langstein, Hanna"] = "hblangstein@fcps.edu"
		emailDictionary["Lewis, Terry"] = "HBLewis@fcps.edu"
		emailDictionary["Mazan, Allen"] = "awmazan@fcps.edu"
		emailDictionary["Nave, Amy"] = "AANave@fcps.edu"
		emailDictionary["Singh, Anita"] = "ASingh1@fcps.edu"
		emailDictionary["Williamson Theil, Robin"] = "rlwilliamson@fcps.edu"
		
		//Counselors
		emailDictionary["Chace, Anne-Marie"] = "alchace@fcps.edu"
		emailDictionary["DeHaven, Sinitra"] = "sldehaven@fcps.edu"
		emailDictionary["Doss, Dana"] = "dbdoss@fcps.edu"
		emailDictionary["Foussekis, Katherine"] = "kafoussekis@fcps.edu"
		emailDictionary["Koo, Autumn"] = "ATKoo@fcps.edu"
		emailDictionary["Mehaffey, Linda"] = "LEMehaffey@fcps.edu"
		emailDictionary["No, Jean"] = "jno@fcps.edu"
		emailDictionary["Schneider, Nancy"] = "NWSchneider@fcps.edu"
		emailDictionary["Thompson, Donna"] = "DNThompson@fcps.edu"
		emailDictionary["Vasquez, Jimmy"] = "VSVasquez@fcps.edu"
		
		//World Languages Teachers
		emailDictionary["Andros, Christina"] = "ccandros@fcps.edu"
		emailDictionary["Fasick, Elise"] = "EMFasick@fcps.edu"
		emailDictionary["Haber, Barbara"] = "BMHaber@fcps.edu"
		emailDictionary["Lott, Antonia"] = "ALott@fcps.edu"
		emailDictionary["Martin, Judith"] = "JAMartin1@fcps.edu"
		emailDictionary["Mayhew, Katie"] = "KVMayhew@fcps.edu"
		emailDictionary["Rife, Melissa"] = "MMRife1@fcps.edu"
		emailDictionary["Taboada, Marina"] = "mtaboada@fcps.edu"
		emailDictionary["Turpin, Sophie"] = "ssturpin@fcps.edu"
		emailDictionary["Yu, Patricia"] = "pbyu@fcps.edu"
		
		//Other Teachers
		emailDictionary["Hudson, Mike"] = "gmhudson@fcps.edu"
		emailDictionary["Miller, Noel"] = "NLMiller@fcps.edu"
		emailDictionary["Pevner, Sarah"] = "sjpevner@fcps.edu"
		emailDictionary["Rose, Lyman"] = "LGRose@fcps.edu"
		emailDictionary["Stamper, Kara"] = "KAStamper@fcps.edu"
	
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
			let cell = UITableViewCell()
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
			return 45
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
			let alert = UIAlertController.init(title: "What would you like to do?", message: "Would you like to copy this teacher's email, or start a new email to this teacher?", preferredStyle: UIAlertControllerStyle.ActionSheet)
			
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
