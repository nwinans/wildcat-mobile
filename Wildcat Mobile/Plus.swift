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
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("plus")
    
    struct plusses {
        static let date = "date"
        static let plus = "plus"
        static let fullPlus = "fullplus"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: plusses.date)
        aCoder.encode(plus, forKey: plusses.plus)
        aCoder.encode(fullPlus, forKey: plusses.fullPlus)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let date = aDecoder.decodeObject(forKey: plusses.date) as! String
        let plus = aDecoder.decodeObject(forKey: plusses.plus) as! String
        let fullplus = aDecoder.decodeObject(forKey: plusses.fullPlus) as! String
        
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
        self.fullPlus = "A+1"
        super.init()
        
        self.fullPlus = self.getFullPlus(plus: plus)
        
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
                return "A+" + String(describing: shortPlus)
            } else if shortPlus == 2 || shortPlus == 4 || shortPlus == 6  {
                return "B+" + String(describing: shortPlus)
            } else if shortPlus == 8 {
                return "B+7"
            }
        }
        
        return plus
    }
    
}
