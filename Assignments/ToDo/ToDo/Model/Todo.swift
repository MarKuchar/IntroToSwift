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
    typealias RawValue = String
    
    init?(rawValue: String) {
        switch rawValue {
            case "low":
                self = .low
            case "medium":
                self = .medium
            case "high":
                self = .high
            default:
            return nil
        }
    }
    
    var rawValue: String {
        switch self {
            case .low:
                return "low"
            case .medium:
                return "medium"
            case .high:
                return "high"
        }
    }
}
