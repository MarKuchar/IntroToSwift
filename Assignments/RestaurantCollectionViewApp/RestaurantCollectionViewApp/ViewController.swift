//
//  ViewController.swift
//  RestaurantCollectionViewApp
//
//  Created by Martin Kuchar on 2020-08-18.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

protocol FilterFoodDelegate: class {
    func filterFood(byKind: Food.Kind)
}

class ViewController: UIViewController, FilterFoodDelegate {
    
    private var food: [Food] = Food.foods()
    private var filteringSet: Set<Food.Kind> = []
    private var filteredFood: [Food] = []
    var headerView: HeaderView!
    private let padding: CGFloat = 8
    private let cellId = "RestaurantCell"
    
    private var isFiltering = false
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .lightGray
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationControllerSetup()
        headerSetup()
        collectionViewSetup()
    }
    
    func navigationControllerSetup() {
        navigationItem.title = "My Restaurants"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = .systemBlue
    }
    
    func headerSetup() {
        headerView = HeaderView()
        headerView.delegate = self
        headerView.constraintHeight(equalToConstant: 50)
        view.addSubview(headerView)
        view.addSubview(collectionView)
        headerView.anchors(topAnchor: view.safeAreaLayoutGuide.topAnchor, leadingAnchor: view.leadingAnchor,
                           trailingAnchor: view.trailingAnchor, bottomAnchor: collectionView.topAnchor,
                           padding: .init(top: 0, left: 0, bottom: 10, right: 0))
    }
    
    func collectionViewSetup() {
        collectionView.anchors(topAnchor: headerView.bottomAnchor, leadingAnchor: view.leadingAnchor,
                               trailingAnchor: view.trailingAnchor, bottomAnchor: view.bottomAnchor,
                               padding: .init(top: 10, left: 10, bottom: 5, right: 10))
        collectionView.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func filterFood(byKind: Food.Kind) {
        if !filteringSet.insert(byKind).inserted {
            filteringSet.remove(byKind)
        }
        filteredFood = food.filter { (food) in
            return filteringSet.contains(food.kind)
        }
        isFiltering = !filteringSet.isEmpty
        collectionView.reloadData()
        UIView.animate(withDuration: 1) {
          self.view.layoutIfNeeded()
        }
    }
}


extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isFiltering ? filteredFood.count : food.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RestaurantCollectionViewCell
        cell.imageView.image = UIImage(named: isFiltering ? filteredFood[indexPath.row].name : food[indexPath.row].name)
        cell.nameLabel.text = isFiltering ? filteredFood[indexPath.row].name : food[indexPath.row].name
        cell.kindLabel.text = isFiltering ? filteredFood[indexPath.row].kind.rawValue : food[indexPath.row].kind.rawValue
        cell.costLabel.text = isFiltering ? filteredFood[indexPath.row].cost : food[indexPath.row].cost
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (collectionView.frame.width - 3 * padding) / 2
        return CGSize(width: side, height: side + 20)
    }
}



