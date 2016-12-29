//
//  Group.swift
//  BrowseMeetup
//
//  Created by Simon Ng on 28/12/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import Foundation

struct Group {
    let createdAt: Double!
    let photoUrl: URL!
    let city: String!
    let country: String!
    let organizer: Organizer!
    
    var timeInterval: String {
        let date = Date(timeIntervalSince1970: createdAt)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: date)
    }
}
