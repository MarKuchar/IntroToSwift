//
//  DatePickerTableViewCell.swift
//  HotelForm
//
//  Created by Derrick Park on 5/15/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell {
  
  let datePicker = UIDatePicker()
  
  var datePickerValueChanged: (() -> ())?
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(datePicker)
    datePicker.matchParent()
    datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
  }
  
  @objc func datePickerValueChanged(_ sender: UIDatePicker) {
    datePickerValueChanged?()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
