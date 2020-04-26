//
//  MyGrayButton.swift
//  AutoLayoutInCode
//
//  Created by Derrick Park on 4/24/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class MyGrayButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  convenience init() {
    self.init(frame: .zero)
    self.setTitle("Center Button", for: .normal)
    self.setTitleColor(.systemBlue, for: .normal)
    self.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundColor = .darkGray
    self.layer.cornerRadius = 16
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

