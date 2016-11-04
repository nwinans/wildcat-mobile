//
//  Plus.swift
//  Wildcat Mobile
//
//  Created by Nick Winans on 11/3/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import Foundation

class Plus: NSObject, NSCoding {
    var date: String
    var plus: String
    var fullPlus: String
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("plus")
    
    struct plusses {
        static let date = "date"
        static let plus = "plus"
        static let fullPlus = "fullplus"
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(date, forKey: plusses.date)
        aCoder.encodeObject(plus, forKey: plusses.plus)
        aCoder.encodeObject(fullPlus, forKey: plusses.fullPlus)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let date = aDecoder.decodeObjectForKey(plusses.date) as! String
        let plus = aDecoder.decodeObjectForKey(plusses.plus) as! String
        let fullplus = aDecoder.decodeObjectForKey(plusses.fullPlus) as! String
        
        self.init(date: date, plus: plus, fullplus: fullplus)
    }
    
    init?(date: String, plus: String, fullplus: String) {
        self.date = date
        self.plus = plus
        self.fullPlus = fullplus
        
        super.init()
        
        if date.isEmpty || plus.isEmpty || fullPlus.isEmpty {
            return nil
        }
    }
    
    init?(date: String, plus: String) {
        self.date = date
        self.plus = plus
        self.fullPlus = self.getFullPlus(plus)
        
        super.init()
        
        if date.isEmpty || plus.isEmpty || fullPlus.isEmpty {
            return nil
        }
    }
    
    override init() {
        self.date = "01-01-2017"
        self.plus = "1"
        self.fullPlus = "A+1"
    }
    
    func getFullPlus(plus: String) -> String {
        if (plus != "A" && plus != "B") {
            let shortPlus = Int(plus)
            if shortPlus == 1 || shortPlus == 3 || shortPlus == 5 || shortPlus == 7 {
                return "A+" + String(shortPlus)
            } else if shortPlus == 2 || shortPlus == 4 || shortPlus == 6  {
                return "B+" + String(shortPlus)
            } else if shortPlus == 8 {
                return "B+7"
            }
        }
        
        return plus
    }
    
}
