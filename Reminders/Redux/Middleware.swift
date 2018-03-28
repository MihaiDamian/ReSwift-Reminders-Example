//
//  Middleware.swift
//  Reminders
//
//  Created by Mihai Damian on 28/03/2018.
//  Copyright © 2018 Mihai Damian. All rights reserved.
//

import Foundation
import ReSwift

let loggingMiddleware: Middleware<Any> = { dispatch, getState in
    return { next in
        return { action in
            print(action)
            return next(action)
        }
    }
}
