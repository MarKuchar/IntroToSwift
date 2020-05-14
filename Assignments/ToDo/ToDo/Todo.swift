//
//  Todo.swift
//  ToDo
//
//  Created by Martin Kuchar on 2020-05-13.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import Foundation

struct Todo {
    let title: String
    let priority: priority
    let isCompleted: Bool
    
    enum priority {
        case low, medium, heigh
    }
}
