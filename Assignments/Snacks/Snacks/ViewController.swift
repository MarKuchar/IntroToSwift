//
//  ViewController.swift
//  Snacks
//
//  Created by Martin Kuchar on 2020-05-21.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet var plusBtn: UIButton!
    
    @IBOutlet var customNavBar: UIView!
    
    var arrayOfSnacks: [String] = .init()
    
    let oreoImage: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "oreos"), for: .normal)
        return btn
    }()
    
    let pizzaImage: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "pizza_pockets"), for: .normal)
        return btn
    }()
    
    let popTartsImage: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "pop_tarts"), for: .normal)
        return btn
    }()
    
    let popsicleImage: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "popsicle"), for: .normal)
        return btn
    }()
    
    let ramenImage: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "ramen"), for: .normal)
        return btn
    }()
    
    
    
    
    let oreoImage1 = UIImageView(image: UIImage(named: "oreos"))
    let pizzaImage1 = UIImageView(image: UIImage(named: "pizza_pockets"))
    let popTartsImage1 = UIImageView(image: UIImage(named: "pop_tarts"))
    let popsicleImage1 = UIImageView(image: UIImage(named: "popsicle"))
    let ramenImage1 = UIImageView(image: UIImage(named: "ramen"))
    
    var stackOfSnacks: UIStackView = {
        let hView = UIStackView()
        hView.translatesAutoresizingMaskIntoConstraints = false
        hView.axis = .horizontal
        hView.distribution = .fillEqually
        hView.isHidden = true
        return hView
    }()
    
    var isDisplaying: Bool = true {
        didSet {
            if !isDisplaying {
                plusBtn.tag = 0
            } else {
                plusBtn.tag = 1
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavBar.addSubview(stackOfSnacks)
        createDummy()
        
    }

    @objc func imageTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        if gestureRecognizer.name == "gestureRecognizer1" {
            
            print("bla")
        }
        print(#function)
    }

    @IBAction func plusIconPressed(_ sender: UIButton) {
        switch sender.tag {
            case 0:
                UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.12, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.heightConstraint.constant = 170
                    let rotationTransform = CGAffineTransform(rotationAngle: .pi/4)
                    self.plusBtn.transform = rotationTransform
                    self.view.layoutIfNeeded()
                    self.stackOfSnacks.isHidden = false
                }, completion: ((Bool) -> Void)? { _ in
                    self.isDisplaying = true
                });
            default:
                UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.12, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.heightConstraint.constant = 88
                    self.plusBtn.transform = .identity
                    self.view.layoutIfNeeded()
                    self.stackOfSnacks.isHidden = true
                }, completion: ((Bool) -> Void)? { _ in
                    self.isDisplaying = false
                });
        }
    }
    
    func createDummy() {
        NSLayoutConstraint.activate([
            stackOfSnacks.bottomAnchor.constraint(equalTo: customNavBar.bottomAnchor, constant: -10),
            stackOfSnacks.leadingAnchor.constraint(equalTo: customNavBar.leadingAnchor, constant: 10),
            stackOfSnacks.trailingAnchor.constraint(equalTo: customNavBar.trailingAnchor, constant: -10),
            stackOfSnacks.heightAnchor.constraint(equalToConstant: 80)
        ])
        addImages()
    }
    
    func addImages() {
        stackOfSnacks.addArrangedSubview(oreoImage)
        stackOfSnacks.addArrangedSubview(pizzaImage)
        stackOfSnacks.addArrangedSubview(popTartsImage)
        stackOfSnacks.addArrangedSubview(popsicleImage)
        stackOfSnacks.addArrangedSubview(ramenImage)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }

}

