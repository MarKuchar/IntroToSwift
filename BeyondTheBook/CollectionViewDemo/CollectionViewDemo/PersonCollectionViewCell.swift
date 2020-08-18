//
//  PersonCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by Derrick Park on 8/17/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
  let imageView: UIImageView = {
    let iv = UIImageView()
    iv.translatesAutoresizingMaskIntoConstraints = false
    iv.contentMode = .scaleAspectFill
    iv.layer.masksToBounds = true
    return iv
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(imageView)
    imageView.matchParent()
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}
