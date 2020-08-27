//
//  Todo.swift
//  ToDo
//
//  Created by Martin Kuchar on 2020-05-13.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import Foundation

struct Todo: Equatable {
    let title: String
    let priority: priority
    let isCompleted: Bool
    
    enum priority {
        case low, medium, high
    }
    static func ==(lhs: Todo, rhs: Todo) -> Bool {
        return lhs.title == rhs.title 
    }
}

extension Todo.priority: RawRepresentable {
    typealias RawValue = Int
    
    init?(rawValue: Int) {
        switch rawValue {
            case 2:
                self = .low
            case 1:
                self = .medium
            case 0:
                self = .high
            default:
            return nil
        }
    }
    
    var rawValue: Int {
        switch self {
            case .low:
                return 2
            case .medium:
                return 1
            case .high:
                return 0
        }
    }
}
