//
//  Registration.swift
//  HotelForm
//
//  Created by Derrick Park on 5/15/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

struct Registration {
  static let wifiCost = 10
  
  var firstName: String
  var lastName: String
  var emailAddress: String
  
  var checkInDate: Date
  var checkOutDate: Date
  var numberOfAdults: Int
  var numberOfChildren: Int
  
  var roomType: RoomType
  var wifi: Bool
}
