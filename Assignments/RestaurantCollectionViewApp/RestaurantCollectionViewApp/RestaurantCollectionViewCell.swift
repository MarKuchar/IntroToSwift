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
        iv.setContentHuggingPriority(.required, for: .vertical)
        iv.heightAnchor.constraint(equalToConstant: 140).isActive = true
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
       let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.setContentHuggingPriority(.defaultLow, for: .vertical)
        return lb
    }()
    
    let kindLabel: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.setContentHuggingPriority(.defaultLow, for: .vertical)
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        return lb
    }()
    
    let costLabel: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.setContentHuggingPriority(.defaultLow, for: .vertical)
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        lb.text = "$$"
        return lb
    }()
    
    let vStack: UIStackView = {
       let vs = UIStackView()
        vs.axis = .vertical
        vs.distribution = .equalSpacing
        vs.spacing = 3
        return vs
    }()
    
    let hStack: UIStackView = {
       let hs = UIStackView()
        hs.axis = .horizontal
        hs.distribution = .equalSpacing
        return hs
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(vStack)
        vStack.matchParent()
        vStack.addArrangedSubview(imageView)
        vStack.addArrangedSubview(hStack)
        vStack.addArrangedSubview(kindLabel)
        hStack.addArrangedSubview(nameLabel)
        hStack.addArrangedSubview(costLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
