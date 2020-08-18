//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Derrick Park on 8/17/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var collectionView: UICollectionView!
  private let padding: CGFloat = 8
  private let cellId = "ImageCell"
  private let headerId = "HeaderCell"
  
  override func loadView() {
    super.loadView()
    // create a collectionView
    // 1. CollectionViewFlowLayout (default)
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumInteritemSpacing = padding
    layout.minimumLineSpacing = padding
    // 2. CollectionView Frame
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    view = collectionView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    // inset for the entire collectioView
    collectionView.contentInset = .init(top: 44, left: 0, bottom: 44, right: 0)
    collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    collectionView.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.dataSource = self
    collectionView.delegate = self
  }
}

extension ViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 20
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PersonCollectionViewCell
    
    if indexPath.item % 2 == 0 {
      cell.imageView.image = UIImage(named: "billgates")
    } else {
      cell.imageView.image = UIImage(named: "melinda")
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HeaderView
      headerView.textLabel.text = "MicroSoft! - \(indexPath.section)"
      return headerView
    } else {
      return UICollectionReusableView()
    }
  }
}

extension ViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("Tapped: \(indexPath.item)")
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (collectionView.frame.width - 2 * padding) / 3.0
    return CGSize(width: width, height: width)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: 50)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: padding * 2, left: 0, bottom: padding * 4, right: 0)
  }
}
