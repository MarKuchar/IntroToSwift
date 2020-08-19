//
//  ViewController.swift
//  RestaurantCollectionViewApp
//
//  Created by Martin Kuchar on 2020-08-18.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var food: [Food] = Food.foods()
    var headerView: HeaderView!
    private let padding: CGFloat = 8
    private let cellId = "RestaurantCell"
    
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
        
        navigationItem.title = "My restaurants"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = .blue
        

        headerView = HeaderView()
        headerView.constraintHeight(equalToConstant: 50)
        
        view.addSubview(headerView)
        view.addSubview(collectionView)
        headerView.anchors(topAnchor: view.safeAreaLayoutGuide.topAnchor, leadingAnchor: view.leadingAnchor,
                           trailingAnchor: view.trailingAnchor, bottomAnchor: collectionView.topAnchor,
                           padding: .init(top: 0, left: 0, bottom: 10, right: 0))
        
        collectionViewSetup()
    }

    func collectionViewSetup() {
        collectionView.anchors(topAnchor: headerView.bottomAnchor, leadingAnchor: view.leadingAnchor,
                               trailingAnchor: view.trailingAnchor, bottomAnchor: view.bottomAnchor,
                               padding: .init(top: 10, left: 10, bottom: 5, right: 10))
        collectionView.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}


extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RestaurantCollectionViewCell
        print(food)
        cell.imageView.image = UIImage(named: food[indexPath.row].name)
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped")
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (collectionView.frame.width - 3 * padding) / 2
        return CGSize(width: side, height: side)
    }
}



