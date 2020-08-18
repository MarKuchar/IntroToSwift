//
//  SushiSubtitleCell.swift
//  SushiLoverDemo
//
//  Created by Derrick Park on 8/18/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class SushiSubtitleCell: UITableViewCell {
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    textLabel?.textColor = .darkGray
    detailTextLabel?.textColor = .mainRed
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
