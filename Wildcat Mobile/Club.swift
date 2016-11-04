//
//  Club.swift
//  Wildcat Mobile
//
//  Created by Nick Winans on 11/3/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import Foundation

class Club: NSObject, NSCoding {
    var club: String
    var cdescription: String
    var email: String
    var sponsor: String
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("clubs")
    
    struct clubs {
        static let club = "club"
        static let cdescription = "cdescription"
        static let email = "email"
        static let sponsor = "sponsor"
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(club, forKey: clubs.club)
        aCoder.encodeObject(cdescription, forKey: clubs.cdescription)
        aCoder.encodeObject(email, forKey: clubs.email)
        aCoder.encodeObject(sponsor, forKey: clubs.sponsor)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let club = aDecoder.decodeObjectForKey(clubs.club) as? String
        let cdescription = aDecoder.decodeObjectForKey(clubs.cdescription) as? String
        let email = aDecoder.decodeObjectForKey(clubs.email) as? String
        let sponsor = aDecoder.decodeObjectForKey(clubs.sponsor) as? String
        
        self.init(club: club!, cdescription: cdescription!, email: email!, sponsor: sponsor!)
    }
    
    init?(club: String, cdescription: String, email: String, sponsor: String) {
        self.club = club
        self.cdescription = cdescription
        self.email = email
        self.sponsor = sponsor
        
        super.init()
        
        if club.isEmpty || description.isEmpty || email.isEmpty || sponsor.isEmpty {
            return nil
        }
    }
    
    override init() {
        self.club = "Club"
        self.cdescription = "Description"
        self.email = "Email"
        self.sponsor = "Sponsors"
    }
}
