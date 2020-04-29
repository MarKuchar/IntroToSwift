//
//  ViewController.swift
//  AutoLayoutInCode
//
//  Created by Derrick Park on 4/24/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  // 1. create a view object
  // 2. configure the object
  // 3. add the view object as subview
  // 4. set constraints
  var centerBtn: MyGrayButton = MyGrayButton()
  
  var centerBtn2: MyGrayButton = MyGrayButton()
  
  var centerBtn3: MyGrayButton = MyGrayButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .gray
    let vStackView = UIStackView(arrangedSubviews: [centerBtn, centerBtn2, centerBtn3])
    vStackView.translatesAutoresizingMaskIntoConstraints = false
    vStackView.axis = .vertical
    vStackView.alignment = .center
    vStackView.distribution = .equalSpacing
    vStackView.spacing = 50
    view.addSubview(vStackView)
    
    NSLayoutConstraint.activate([
      vStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      vStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      centerBtn.heightAnchor.constraint(equalToConstant: 100),
      centerBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
      centerBtn2.heightAnchor.constraint(equalTo: centerBtn.heightAnchor),
      centerBtn2.widthAnchor.constraint(equalTo: centerBtn.widthAnchor),
      centerBtn3.heightAnchor.constraint(equalTo: centerBtn.heightAnchor),
      centerBtn3.widthAnchor.constraint(equalTo: centerBtn.widthAnchor),
    ])
  }
}

