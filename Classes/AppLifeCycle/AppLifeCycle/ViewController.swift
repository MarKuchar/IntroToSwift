//
//  ViewController.swift
//  AppLifeCycle
//
//  Created by Derrick Park on 5/7/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var counter: Int = 0
    
  let contentView: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = .red
    v.widthAnchor.constraint(equalToConstant: 100).isActive = true
    v.heightAnchor.constraint(equalToConstant: 100).isActive = true
    return v
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(removeFromSuperView))
    
    view.addSubview(contentView)
    contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
  }
  
  @objc func removeFromSuperView(_ sender: UIBarButtonItem) {
    contentView.removeFromSuperview()
  }

}

