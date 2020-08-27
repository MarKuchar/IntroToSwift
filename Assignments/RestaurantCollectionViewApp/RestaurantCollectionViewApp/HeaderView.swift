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
    weak var delegate: FilterFoodDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        collectionViewSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionViewSetup() {
        let customLayout = UICollectionViewFlowLayout()
        customLayout.scrollDirection = .horizontal
        customLayout.minimumLineSpacing = 15
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: customLayout)
        collectionView.register(RestKindCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
        collectionView.backgroundColor = .lightGray
        collectionView.matchParent()
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
        return cell
    }
}

extension HeaderView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? RestKindCollectionViewCell {
            cell.label.backgroundColor = cell.label.backgroundColor == .white ? .systemBlue : .white
            cell.label.textColor = cell.label.backgroundColor == .white ? .systemBlue : .white
        }
        delegate?.filterFood(byKind: Food.Kind.allCases[indexPath.row])
    }
}

extension HeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 65, height: 25)
    }
}
