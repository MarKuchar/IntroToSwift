//
//  PhotoInfo.swift
//  HTTPandURLSession1Demo
//
//  Created by Derrick Park on 5/22/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {
  var title: String
  var description: String
  var url: URL
  var copyright: String?
  var mediaType: String
  
  enum CodingKeys: String, CodingKey {
    case title
    case description = "explanation"
    case url
    case copyright
    case mediaType = "media_type"
  }
}

//let json = """
//[
//    {
//        "name": {
//            "first_name": "Taylor",
//            "last_name": "Swift"
//        },
//        "age": 26
//    }
//]
//"""

// 1. easier (nested)

//struct User: Codable {
//  struct Name: Codable {
//    var firstName: String
//    var lastName: String
//  }
//
//  var name: Name
//  var age: Int
//}
//
//func a() {
//
//  let user = User(name: User.Name(firstName: "Derrick", lastName: "Park"), age: 33)
//  user.name.firstName
//}

// 2. manual (nested)

//struct User: Codable {
//  var firstName: String
//  var lastName: String
//  var age: Int
//
//  enum CodingKeys: String, CodingKey {
//    case name, age
//  }
//
//  enum NameCodingKeys: String, CodingKey {
//    case firstName, lastName
//  }
//
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    age = try container.decode(Int.self, forKey: .age)
//    let name = try container.nestedContainer(keyedBy: NameCodingKeys.self, forKey: .name)
//    firstName = try name.decode(String.self, forKey: .firstName)
//    lastName = try name.decode(String.self, forKey: .lastName)
//  }
//
//  init(firstName: String, lastName: String, age: Int) {
//    self.firstName = firstName
//    self.lastName = lastName
//    self.age = age
//  }
//
//  func encode(to encoder: Encoder) throws {
//      var container = encoder.container(keyedBy: CodingKeys.self)
//      try container.encode(age, forKey: .age)
//
//      var name = container.nestedContainer(keyedBy: NameCodingKeys.self, forKey: .name)
//      try name.encode(firstName, forKey: .firstName)
//      try name.encode(lastName, forKey: .lastName)
//  }
//}


