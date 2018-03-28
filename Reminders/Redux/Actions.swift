//
//  Actions.swift
//  Reminders
//
//  Created by Mihai Damian on 27/03/2018.
//  Copyright © 2018 Mihai Damian. All rights reserved.
//

import Foundation
import ReSwift

struct AddReminder: Action {
    let reminder: Reminder
}

struct UpdateReminder: Action {
    let reminder: Reminder
    let index: Int
}

struct RemoveReminder: Action {
    let index: Int
}
