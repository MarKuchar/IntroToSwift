//
//  RestaurantCollectionViewCell.swift
//  RestaurantCollectionViewApp
//
//  Created by Martin Kuchar on 2020-08-18.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
       let lb = UILabel()
        lb.text = "Name"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let kindLabel: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Kind"
        return lb
    }()
    
    let costLabel: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let vStack: UIStackView = {
       let vs = UIStackView()
        vs.axis = .vertical
        vs.distribution = .equalSpacing
        vs.spacing = 10
        return vs
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(vStack)
        vStack.matchParent()
        vStack.addArrangedSubview(imageView)
        vStack.addArrangedSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
