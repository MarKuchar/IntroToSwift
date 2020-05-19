//
//  SwitchTableViewCell.swift
//  HotelForm
//
//  Created by Derrick Park on 5/19/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
  
  private let categoryLabel: UILabel = {
    let lb = UILabel()
    lb.translatesAutoresizingMaskIntoConstraints = false
    lb.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    return lb
  }()
  
  private let priceLabel: UILabel = {
    let lb = UILabel()
    lb.translatesAutoresizingMaskIntoConstraints = false
    lb.setContentHuggingPriority(.required, for: .horizontal)
    return lb
  }()
  
  private let switchControl: UISwitch = {
    let sp = UISwitch()
    sp.translatesAutoresizingMaskIntoConstraints = false
    return sp
  }()
  
  var isOn: Bool {
    get {
      return switchControl.isOn
    }
    set {
      switchControl.isOn = newValue
    }
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  convenience init(category: String) {
    self.init()
    categoryLabel.text = category
    priceLabel.text = "$ \(Registration.wifiCost)"
    let hs = HorizontalStackView(arrangedSubviews: [
      categoryLabel, priceLabel, switchControl
    ], spacing: 15, alignment: .center, distribution: .fill)
    contentView.addSubview(hs)
    hs.matchParent(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
