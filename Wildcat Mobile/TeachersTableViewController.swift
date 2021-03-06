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
	
	//setup dictionary of emails for teachers
	var emailDictionary: [String: String] = [String: String]()
	
	//setup variables used by SwiftAccordianCell to expand and contract the table
	var previouslySelectedHeaderIndex: Int?
	var currentlySelectedHeaderIndex: Int?
	var currentlySelectedItemIndex: Int?
	
	//setup cells variable that will hold the headers and cells of the teachers for the table
	let cells = SwiftyAccordionCells()
	
	//defualt function run when view had been loaded
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//run setup function in this class
		self.setup()
		/*
		//sets up tableview to use automatic height of cells - allows for cells to expand or contact with larger and smaller fonts
		self.tableView.estimatedRowHeight = 45
		self.tableView.rowHeight = UITableViewAutomaticDimension*/
	}
	
	
	//setup the cells variable to include all teachers
	func setup() {
		//setup math header
		self.cells.append(item: SwiftyAccordionCells.HeaderItem(value: "Mathematics"))
		//run through every item in mathTeachers and add it to the cells variable
		for teacher in mathTeachers {
			self.cells.append(item: SwiftyAccordionCells.Item(value: teacher))
		}
		
		//setup science teachers
		self.cells.append(item: SwiftyAccordionCells.HeaderItem(value: "Science"))
		for teacher in scienceTeachers {
			self.cells.append(item: SwiftyAccordionCells.Item(value: teacher))
		}
		
		//setup social studies teachers
		self.cells.append(item: SwiftyAccordionCells.HeaderItem(value: "Social Studies"))
		for teacher in socialTeachers {
			self.cells.append(item: SwiftyAccordionCells.Item(value: teacher))
		}
		
		//setup english teachers
		self.cells.append(item: SwiftyAccordionCells.HeaderItem(value: "English"))
		for teacher in englishTeachers {
			self.cells.append(item: SwiftyAccordionCells.Item(value: teacher))
		}
		
		//setup pe teachers
		self.cells.append(item: SwiftyAccordionCells.HeaderItem(value: "Physical Education"))
		for teacher in peTeachers {
			self.cells.append(item: SwiftyAccordionCells.Item(value: teacher))
		}
		
		//setup world language teachers
		self.cells.append(item: SwiftyAccordionCells.HeaderItem(value: "World Languages"))
		for teacher in worldLanguagesTeachers {
			self.cells.append(item: SwiftyAccordionCells.Item(value:teacher))
		}
		
		//setup music teachers
		self.cells.append(item: SwiftyAccordionCells.HeaderItem(value: "Music"))
		for teacher in musicTeachers {
			self.cells.append(item: SwiftyAccordionCells.Item(value: teacher))
		}
		
		//setup cte teachers
		self.cells.append(item: SwiftyAccordionCells.HeaderItem(value: "Career Technical Education"))
		for teacher in cteTeachers {
			self.cells.append(item: SwiftyAccordionCells.Item(value: teacher))
		}
		
		//setup art teachers
		self.cells.append(item: SwiftyAccordionCells.HeaderItem(value: "Art"))
		for teacher in artTeachers {
			self.cells.append(item: SwiftyAccordionCells.Item(value: teacher))
		}
		
		//setup esol teachers
		self.cells.append(item: SwiftyAccordionCells.HeaderItem(value: "ESOL"))
		for teacher in esolTeachers {
			self.cells.append(item: SwiftyAccordionCells.Item(value: teacher))
		}
		
		//setup counselors
		self.cells.append(item: SwiftyAccordionCells.HeaderItem(value: "Counselor"))
		for teacher in counselorTeachers {
			self.cells.append(item: SwiftyAccordionCells.Item(value: teacher))
		}
		
		//setup other teachers
        self.cells.append(item: SwiftyAccordionCells.HeaderItem(value: "Other"))
		for teacher in otherTeachers {
			self.cells.append(item: SwiftyAccordionCells.Item(value: teacher))
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
	
	//required function that sets the total number of sections in the tableview - only one here because we are setting up sections differently (with SwiftyAccoridanCells)
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.items.count
    }

	
	//setup the tableview cell for the given indexPath
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		//Get the current cell from the cells array
		let item = self.cells.items[indexPath.row]
		//Get the calue of the current cell from the above variable
		let value = item.value
		
		//if the item isn't a header cell...
		if item as? SwiftyAccordionCells.HeaderItem == nil {
			//...create a new blank cell, with a max of 2 lines and the value is the teachers name and the email on a new line
			let cell = UITableViewCell()
			cell.textLabel?.numberOfLines = 2
			cell.textLabel?.text = value + "\n" + emailDictionary[value]!
			return cell
		} else {
			//...if the cell is a header cell, create a new cell with a black background and white text that has the Department name on it 
			let cell = UITableViewCell()
			cell.textLabel?.text = value
			cell.backgroundColor = UIColor.black
			cell.textLabel?.textColor = UIColor.white
			cell.selectionStyle = UITableViewCellSelectionStyle.none
			return cell
		}
		
	}
	
	//optional function to have different cell heights
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		//get the current cell from the cells array
		let item = self.cells.items[indexPath.row]
		
		//if the cell is a header...
		if item is SwiftyAccordionCells.HeaderItem {
			//... the height is 45
			return 45
		} else if item.isHidden {
			//... if the item isn't a header but is hidden, return 0 height
			return 0
		} else {
			//...return the autoheight of the cell
			return UITableViewAutomaticDimension
		}
	}
	
	//optional function to perform an action when a cell is selected
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//get the current cell
		let item = self.cells.items[indexPath.row]
		//if the cell is a header item...
		if item is SwiftyAccordionCells.HeaderItem {
			//...and there is no previously selected header...
			if self.currentlySelectedHeaderIndex == nil {
				//...set the selectedHeader to the current row/header
				self.currentlySelectedHeaderIndex = indexPath.row
			//...and there is a a previously selected header...
			} else {
				//set the previouslySelectedHeader to the value of the currentlySelectedHeaderIndex
				self.previouslySelectedHeaderIndex = self.currentlySelectedHeaderIndex
				//and update the currently selected header index to the new selected header index
				self.currentlySelectedHeaderIndex = indexPath.row
			}
			
			//if the previouslySelectedHeaderIndex isn't nil, set it to a local variable named the same thing
			if let previouslySelectedHeaderIndex = self.previouslySelectedHeaderIndex {
				//collapse all the cells in the previously selected header
				self.cells.collapse(headerIndex: previouslySelectedHeaderIndex)
			}
			
			//if the user didnt select the same header as previously selected...
			if self.previouslySelectedHeaderIndex != self.currentlySelectedHeaderIndex {
				//expand the cells under the new header
				self.cells.expand(headerIndex: self.currentlySelectedHeaderIndex!)
			} else {
				//set both current and previous headers to nil as there is no header open anymore
				self.currentlySelectedHeaderIndex = nil
				self.previouslySelectedHeaderIndex = nil
			}
			
			//notify the tableview that the data has been updated
			self.tableView.beginUpdates()
			self.tableView.endUpdates()
		
		//if the selected cell is a teacher cell (not a header)
		} else {
			//set the currently selected cell equal to the current row
			self.currentlySelectedItemIndex = indexPath.row
			
			//setup a UIAlertController (will present the user with an action sheet that pops up from the bottom)
			let alert = UIAlertController.init(title: "What would you like to do?", message: "Would you like to copy this teacher's email, or start a new email to this teacher?", preferredStyle: UIAlertControllerStyle.actionSheet)
			
			//create a new action that will be added to the alert that copies the teacher's email
			let copyAction = UIAlertAction.init(title: "Copy", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
				UIPasteboard.general.string = self.emailDictionary[item.value]!
			})
			
			//create a new action that will be added to the alert that starts a new email addressed to the teacher they selected
			let sendAction = UIAlertAction.init(title: "Send an Email", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
				UIApplication.shared.openURL(NSURL(string: "mailto:" + self.emailDictionary[item.value]!)! as URL)
			})
			
			//create a cancel action that closes the action sheet
			let cancelAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (UIAlertAction) in
				self.dismiss(animated: true, completion: nil)
			})
			
			//add the actions created above to the action sheet
			alert.addAction(copyAction)
			alert.addAction(sendAction)
			alert.addAction(cancelAction)
			
			//present the action sheet that was just created
			self.present(alert, animated: true, completion: nil)
		}
	}
}
