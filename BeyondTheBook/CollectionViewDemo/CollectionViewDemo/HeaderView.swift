//
//  HeaderView.swift
//  CollectionViewDemo
//
//  Created by Derrick Park on 8/17/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
  let textLabel: UILabel = {
    let lb = UILabel()
    lb.textAlignment = .center
    lb.textColor = .white
    lb.font = UIFont.boldSystemFont(ofSize: 30)
    lb.translatesAutoresizingMaskIntoConstraints = false
    return lb
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .cyan
    addSubview(textLabel)
    textLabel.matchParent(padding: .init(top: 8, left: 8, bottom: 8, right: 8))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
