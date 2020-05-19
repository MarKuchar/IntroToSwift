//
//  StepperTableViewCell.swift
//  HotelForm
//
//  Created by Derrick Park on 5/19/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class StepperTableViewCell: UITableViewCell {
  
  private let guestLabel: UILabel = {
    let lb = UILabel()
    lb.translatesAutoresizingMaskIntoConstraints = false
    lb.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    return lb
  }()
  
  private let numberLabel: UILabel = {
    let lb = UILabel()
    lb.translatesAutoresizingMaskIntoConstraints = false
    lb.setContentHuggingPriority(.required, for: .horizontal)
    return lb
  }()
  
  private lazy var stepper: UIStepper = {
    let sp = UIStepper()
    sp.translatesAutoresizingMaskIntoConstraints = false
    sp.addTarget(self, action: #selector(stepperValueChange(_:)), for: .valueChanged)
    return sp
  }()
  
  var numberOfGuests: Int {
    get {
      return Int(stepper.value)
    }
    set {
      numberLabel.text = "\(newValue)"
    }
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  convenience init(guestType: String) {
    self.init()
    guestLabel.text = guestType
    numberLabel.text = "0"
    let hs = HorizontalStackView(arrangedSubviews: [
      guestLabel, numberLabel, stepper
    ], spacing: 15, alignment: .center, distribution: .fill)
    contentView.addSubview(hs)
    hs.matchParent(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func stepperValueChange(_ sender: UIStepper) {
    numberLabel.text = "\(Int(sender.value))"
  }

}
