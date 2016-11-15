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
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("clubs")
    
    struct clubs {
        static let club = "club"
        static let cdescription = "cdescription"
        static let email = "email"
        static let sponsor = "sponsor"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(club, forKey: clubs.club)
        aCoder.encode(cdescription, forKey: clubs.cdescription)
        aCoder.encode(email, forKey: clubs.email)
        aCoder.encode(sponsor, forKey: clubs.sponsor)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let club = aDecoder.decodeObject(forKey: clubs.club) as? String
        let cdescription = aDecoder.decodeObject(forKey: clubs.cdescription) as? String
        let email = aDecoder.decodeObject(forKey: clubs.email) as? String
        let sponsor = aDecoder.decodeObject(forKey: clubs.sponsor) as? String
        
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
