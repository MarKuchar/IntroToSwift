//
//  HeaderCollectionReusableView.swift
//  RestaurantCollectionViewApp
//
//  Created by Martin Kuchar on 2020-08-18.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

// MARK: - HeaderCollectionReusableView was not used in the project

class HeaderCollectionReusableView: UICollectionReusableView {
    let label: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.text = "My restaurants"
        lb.adjustsFontSizeToFitWidth = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.boldSystemFont(ofSize: 33)
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        backgroundColor = .white
//        label.widthAnchor.constraint(greaterThanOrEqualToConstant: label.intrinsicContentSize.width).isActive = true
//        label.matchParent(padding: .init(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
