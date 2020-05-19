//
//  TextFieldTableViewCell.swift
//  HotelForm
//
//  Created by Derrick Park on 5/15/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

  private let textField = UITextField()
  
  var textStr: String? {
    get {
      return textField.text
    }
    set {
      textField.text = newValue
    }
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  
  }
  
  convenience init(placeholder: String) {
    self.init()
    contentView.addSubview(textField)
    textField.matchParent(padding: .init(top: 5, left: 16, bottom: 5, right: 16))
    textField.placeholder = placeholder
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}
