//
//  Food.swift
//  RestaurantCollectionViewApp
//
//  Created by Martin Kuchar on 2020-08-18.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import Foundation

struct Food: Decodable {
    let name: String
    let kind: Kind
    
    enum Kind: Decodable {
        case american
        case slovak
        case mexican
        case french
        case italian
    }
}

extension Food.Kind: CaseIterable { }

extension Food.Kind: RawRepresentable {
    typealias RawValue = String
    
    init?(rawValue: String) {
        switch rawValue {
            case "American":
                self = .american
            case "Slovak":
                self = .slovak
            case "French":
                self = .french
            case "Mexican":
                self = .mexican
            case "Italian":
                self = .italian
            default:
                return nil
        }
    }
    
    var rawValue: String {
        switch self {
            case .american:
                return "American"
            case .slovak:
                return "Slovak"
            case .mexican:
                return "Mexican"
            case .italian:
                return "Italian"
            case .french:
                return "French"
        }
    }
}

extension Food {
  static func foods() -> [Food] {
    guard
        let url = Bundle.main.url(forResource: "foods", withExtension: "json"),
        let data = try? Data(contentsOf: url)
        else { return [] }
    
    do {
        return try JSONDecoder().decode([Food].self, from: data)
    } catch {
        print(error.localizedDescription)
        return []
    }
  }
}
