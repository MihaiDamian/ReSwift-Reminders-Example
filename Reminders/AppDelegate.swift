//
//  AppDelegate.swift
//  Reminders
//
//  Created by Mihai Damian on 27/03/2018.
//  Copyright © 2018 Mihai Damian. All rights reserved.
//

import UIKit
import ReSwift

let mainStore = Store<AppState>(
    reducer: counterReducer,
    state: nil,
    middleware: [loggingMiddleware]
)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
}

