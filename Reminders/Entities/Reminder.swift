//
//  Reminder.swift
//  Reminders
//
//  Created by Mihai Damian on 27/03/2018.
//  Copyright © 2018 Mihai Damian. All rights reserved.
//

import Foundation

struct Reminder {
    
    var description: String
    let dateAdded = Date()
    
    init(description: String) {
        self.description = description
    }
}

extension Reminder: Equatable {}

func ==(lhs: Reminder, rhs: Reminder) -> Bool {
    return lhs.description == rhs.description && lhs.dateAdded == rhs.dateAdded
}
