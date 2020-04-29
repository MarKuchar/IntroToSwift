//
//  main.swift
//  Enum
//
//  Created by Derrick Park on 4/28/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation


enum PrimaryColor: Int {
  case blue = 1
  case red = 2
  case yellow = 3
}

let color: PrimaryColor = .blue

print(color.rawValue)

// String Raw value (Immutable, constant let)
enum AmericanLeagueWest: String {
  case athletics = "Oakland"
  case astros = "Houston"
  case angels = "Los Angeles"
  case mariners = "Seattle"
}

print("Mariners are based in \(AmericanLeagueWest.mariners.rawValue)")

var favTeam: AmericanLeagueWest = .mariners
// favTeam.rawValue = "Vancouver"

switch favTeam {
  case .athletics:
    print()
  case .astros:
    print()
  case .angels:
    print()
  case .mariners:
    print()
}

enum AudioRate: String {
  case slow, normal, fast, custom
}

print(AudioRate.slow.rawValue) // "slow"

if let secondFav = AmericanLeagueWest(rawValue: "Seattle") {
  // AmericanLeagueWest.mariners
  print(secondFav)
}

// Associated Values
// - Associated values are defined alongside enum cases. Associated values are not required;
//   Some enum cases may have an assoicated value while others do not.

enum LibraryFee {
  case overdueBook(days: Int)
  case lostBook(price: Double)
  case lostLibraryCard(timeLost: Date)
  case annualMembership
}

let fee = LibraryFee.overdueBook(days: 5)
// extract associated values
switch fee {
  case .overdueBook(let days):
    print("You need to pay $\(days * 100)")
  case .lostBook(let price):
    print("You need to pay $\(price)")
  case .lostLibraryCard:
    print()
  case .annualMembership:
    print()
}

// Gradient
enum ImageFilter {
  case vivid
  case sepia
  case verticalGradient(from: PrimaryColor, to: PrimaryColor)
  case horizontalGradient(from: PrimaryColor, to: PrimaryColor)
  case sketch(penThickness: Double?)
}

let filter = ImageFilter.horizontalGradient(from: .red, to: .blue)

switch filter {
  case .horizontalGradient(let from, let to):
    print("draw horizontal gradient with \(from) to \(to)")
  case .sketch(let thickness):
    if let thickness = thickness {
      print("sketch using \(thickness) pen thickness.")
    } else {
      print("sketch using default pen thickness.")
    }
  default:
    print("else")
}

enum HTTPResponse {
  case success(json: String)
  case failure(error: Error)
}

enum HTTPRequest {
  case get(url: URL)
  case post(url: URL, body: String)
}

let req = HTTPRequest.get(url: URL(string: "https://www.google.com")!)
let res: HTTPResponse = .success(json: "{\"hell\": \"data\"}")

switch res {
  case .success(let json):
    print(json)
  case .failure(let err):
    print(err.localizedDescription)
}
