//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
    
    var purpleBox: UIView = {
        let purple = UIView()
    // purple.frame = CGRect( x: 0, y: 0, width: 0, height: 0)
        purple.translatesAutoresizingMaskIntoConstraints = false
        purple.backgroundColor = .purple
        return purple
    }()
    
    var redBox: UIView = {
        let red = UIView()
        red.translatesAutoresizingMaskIntoConstraints = false
        red.backgroundColor = .red
        return red
    }()
    
    var orangeBox1: UIView = {
        let orange1 = UIView()
        orange1.translatesAutoresizingMaskIntoConstraints = false
        orange1.backgroundColor = .orange
        return orange1
    }()
    
    var orangeBox2: UIView = {
        let orange2 = UIView()
        orange2.translatesAutoresizingMaskIntoConstraints = false
        orange2.backgroundColor = .orange
        return orange2
    }()
    
    var blueBox: UIView = {
        let blue = UIView()
        blue.translatesAutoresizingMaskIntoConstraints = false
        blue.backgroundColor = .blue
        return blue
    }()
    
    var blueBox2: UIView = {
           let blue = UIView()
           blue.translatesAutoresizingMaskIntoConstraints = false
           blue.backgroundColor = .blue
           return blue
       }()
    
    var blueBox3: UIView = {
           let blue = UIView()
           blue.translatesAutoresizingMaskIntoConstraints = false
           blue.backgroundColor = .blue
           return blue
       }()
    
    var horizontalStacView: UIStackView = {
        var hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        hStack.alignment = .center
        hStack.distribution = .equalSpacing
        hStack.spacing = 10
        return hStack
    }()
    
    var verticalStackView: UIStackView = {
        var vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.distribution = .equalSpacing
        
        return vStack
    }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
    
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
//*********************viewDidLoad*********************
    
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    addViews()
    addConstraints()
    stackProperties()
    setupLayout()
  }
    
//*********************FUNCTIONS*********************
    
    func addViews() {
        mainView.addSubview(purpleBox)
        mainView.addSubview(redBox)
        mainView.addSubview(horizontalStacView)
        mainView.addSubview(verticalStackView)
        view.addSubview(mainView)
     }
    
    func addConstraints() {
        addPurpleBoxConstraints()
        addRedBoxConstraints()
        addHStackConstrains()
        addOrangeBoxConstrains()
        addVStackConstrains()
        addBlueBoxConstraints()
    }
    
    func stackProperties() {
        horizontalStacView.addArrangedSubview(orangeBox1)
        horizontalStacView.addArrangedSubview(orangeBox2)
        verticalStackView.addArrangedSubview(blueBox)
        verticalStackView.addArrangedSubview(blueBox2)
        verticalStackView.addArrangedSubview(blueBox3)
        
    }
    
    func addBlueBoxConstraints() {
        NSLayoutConstraint.activate([blueBox.heightAnchor.constraint(equalToConstant: 80),
        blueBox.widthAnchor.constraint(equalToConstant: 80), blueBox2.heightAnchor.constraint(equalToConstant: 80),
        blueBox2.widthAnchor.constraint(equalToConstant: 80), blueBox3.heightAnchor.constraint(equalToConstant: 80),
        blueBox3.widthAnchor.constraint(equalToConstant: 80)])
    }
    
    func addOrangeBoxConstrains() {
        NSLayoutConstraint.activate([orangeBox1.heightAnchor.constraint(equalToConstant: 40),
        orangeBox1.widthAnchor.constraint(equalToConstant: 55),
        orangeBox2.heightAnchor.constraint(equalToConstant: 40),
        orangeBox2.widthAnchor.constraint(equalToConstant: 95)])
    }
    
    func addVStackConstrains() {
        NSLayoutConstraint.activate([verticalStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
        verticalStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
        verticalStackView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.7, constant: 0),
        verticalStackView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.5, constant: 0)])
    }
    
    func addHStackConstrains() {
        NSLayoutConstraint.activate([horizontalStacView.centerXAnchor.constraint(equalTo: redBox.centerXAnchor),
        horizontalStacView.centerYAnchor.constraint(equalTo: redBox.centerYAnchor), horizontalStacView.heightAnchor.constraint(equalTo: redBox.heightAnchor), horizontalStacView.widthAnchor.constraint(equalTo: redBox.widthAnchor, constant: -20)])
    }
    
    func addRedBoxConstraints() {
        let redBoxTrailingConstraint = NSLayoutConstraint(item: mainView, attribute: .trailing, relatedBy: .equal, toItem: redBox, attribute: .trailing, multiplier: 1, constant: 20)
        let redBoxTopConstraint = NSLayoutConstraint(item: redBox, attribute: .top, relatedBy: .equal, toItem: mainView, attribute: .top, multiplier: 1, constant: 20)
        NSLayoutConstraint.activate([redBoxTopConstraint, redBoxTrailingConstraint, redBox.heightAnchor.constraint(equalToConstant: 60), redBox.widthAnchor.constraint(equalToConstant: 180)])
    }
    
    func addPurpleBoxConstraints() {
        let purpleBoxTrailingConstraint = NSLayoutConstraint(item: mainView, attribute: .trailing, relatedBy: .equal, toItem: purpleBox, attribute: .trailing, multiplier: 1, constant: 20)
        let purpleBoxBottomConstraint = NSLayoutConstraint(item: mainView, attribute: .bottom, relatedBy: .equal, toItem: purpleBox, attribute: .bottom, multiplier: 1, constant: 20)
        let purpleBoxWithConstraint = NSLayoutConstraint(item: purpleBox, attribute: .width, relatedBy: .equal, toItem: mainView, attribute: .width, multiplier: 0.7, constant: 0)
        NSLayoutConstraint.activate([purpleBoxBottomConstraint, purpleBoxTrailingConstraint, purpleBoxWithConstraint, purpleBox.heightAnchor.constraint(equalToConstant: 60)])
    }
    

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }
    
    
    

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

