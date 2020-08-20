//
//  HeaderView.swift
//  RestaurantCollectionViewApp
//
//  Created by Martin Kuchar on 2020-08-18.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    private let cellId = "RestaurantKind"
    var collectionView: UICollectionView!
    private let borderWidth: CGFloat = 0.5
    weak var delegate: FilterFood?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let customLayout = UICollectionViewFlowLayout()
        customLayout.scrollDirection = .horizontal
        customLayout.minimumLineSpacing = 20
        // automaticly change the size
        customLayout.estimatedItemSize = CGSize(width: 30, height: 25)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: customLayout)
        
        collectionView.register(RestKindCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
        collectionView.backgroundColor = .lightGray
        collectionView.matchParent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Food.Kind.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RestKindCollectionViewCell
        cell.label.text = Food.Kind.allCases[indexPath.row].rawValue
        cell.layer.borderWidth = borderWidth
        return cell
    }
    
    
}

extension HeaderView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.filterFood(byKind: Food.Kind.allCases[indexPath.row])
    }
}

extension HeaderView: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//      return .init(top: 8 * 2, left: 0, bottom: 8 * 4, right: 0)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 60, height: 25)
//    }
}
