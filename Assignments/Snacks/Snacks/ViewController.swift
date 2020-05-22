//
//  ViewController.swift
//  Snacks
//
//  Created by Martin Kuchar on 2020-05-21.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet var plusBtn: UIButton!
    
    @IBOutlet var customNavBar: UIView!
    
    let oreoImage = UIImageView(image: UIImage(named: "oreos"))
    let pizzaImage = UIImageView(image: UIImage(named: "pizza_pockets"))
    let popTartsImage = UIImageView(image: UIImage(named: "pop_tarts"))
    let popsicleImage = UIImageView(image: UIImage(named: "popsicle"))
    let ramenImage = UIImageView(image: UIImage(named: "ramen"))
    
    var stackOfSnacks: UIStackView = {
        let hView = UIStackView()
        hView.translatesAutoresizingMaskIntoConstraints = false
        hView.axis = .horizontal
        hView.distribution = .fillEqually
//        hView.spacing = 5
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


    @IBAction func plusIconPressed(_ sender: UIButton) {
        switch sender.tag {
            case 0:
                UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.25, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.heightConstraint.constant = 170
                    let rotationTransform = CGAffineTransform(rotationAngle: .pi/4)
                    self.plusBtn.transform = rotationTransform
                    self.view.layoutIfNeeded()
                    self.stackOfSnacks.isHidden = false
                }, completion: ((Bool) -> Void)? { _ in
                    self.isDisplaying = true
                });
            default:
                UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.25, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.heightConstraint.constant = 88
                    self.plusBtn.transform = .identity
                    self.view.layoutIfNeeded()
                    self.stackOfSnacks.isHidden = true
                }, completion: ((Bool) -> Void)? { _ in
                    self.isDisplaying = false
                });
                UIView.animate(withDuration: 1, animations: {
                    
                })
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
}

