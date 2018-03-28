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
        state.reminders[action.index] = action.reminder
    case let action as RemoveReminder:
        state.reminders.remove(at: action.index)
    default:
        break
    }
    return state
}
