//
//  Reducers.swift
//  Reminders
//
//  Created by Mihai Damian on 27/03/2018.
//  Copyright © 2018 Mihai Damian. All rights reserved.
//

import Foundation
import ReSwift

func counterReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    switch action {
    case let action as AddReminder:
        state.reminders.append(action.reminder)
    case let action as UpdateReminder:
        state.reminders = state.reminders.map {
            $0 == action.reminder ? action.reminder : $0
        }
    default:
        break
    }
    return state
}
