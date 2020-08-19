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
    
    enum Kind {
        case american
        case slovak
        case mexican
        case french
        case italian
    }
}

extension Food.Kind: CaseIterable { }

extension Food.Kind: RawRepresentable {
    init?(rawValue: String) {
        switch rawValue {
            case "american":
                self = .american
            case "slovak":
                self = .slovak
            case "french":
                self = .french
            case "mexican":
                self = .mexican
            case "italian":
                self = .italian
            default:
                return nil
        }
    }
    
    var rawValue: String {
        switch self {
            case .american:
                return "american"
            case .slovak:
                return "slovak"
            case .mexican:
                return "mexican"
            case .italian:
                return "italian"
            case .french:
                return "french"
        }
    }
    
    typealias RawValue = String
}



extension Food {
  static func foods() -> [Food] {
    guard
      let url = Bundle.main.url(forResource: "foodKinds", withExtension: "geojson"),
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
