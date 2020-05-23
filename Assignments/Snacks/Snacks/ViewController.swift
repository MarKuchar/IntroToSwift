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
    
    let titledSnack: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "SNACKS"
        return title
    }()
    
    var arrayOfSnacks: [String] = .init()
    
    @IBOutlet var listOfSnacks: UITableView!
    
    let oreoImage: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "oreos"), for: .normal)
        btn.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
        btn.tag = 0
        return btn
    }()
    
    let pizzaImage: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "pizza_pockets"), for: .normal)
        btn.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
        btn.tag = 1
        return btn
    }()
    
    let popTartsImage: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "pop_tarts"), for: .normal)
        btn.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
        btn.tag = 2
        return btn
    }()
    
    let popsicleImage: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "popsicle"), for: .normal)
        btn.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
        btn.tag = 3
        return btn
    }()
    
    let ramenImage: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "ramen"), for: .normal)
        btn.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
        btn.tag = 4
        return btn
    }()
    
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
        customNavBar.addSubview(titledSnack)
        createDummy()
        listOfSnacks.delegate = self
        listOfSnacks.dataSource = self
        listOfSnacks.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
    }

    @objc func imageTapped(_ sender: UIButton) {
        switch sender.tag {
            case 0:
                arrayOfSnacks.append("Oreo")
            case 1:
                arrayOfSnacks.append("Pizza")
            case 2:
                arrayOfSnacks.append("Pop tarts")
            case 3:
                arrayOfSnacks.append("Popsicle")
            default:
                arrayOfSnacks.append("Ramen")
        }
        // Regular way with reloading data
//        listOfSnacks.reloadData()
        
        // If you want to insert row with this way is going to be with animation
        listOfSnacks.beginUpdates()
        listOfSnacks.insertRows(at: [IndexPath(row: arrayOfSnacks.count-1, section: 0)], with: .automatic)
        listOfSnacks.endUpdates()
    }

    @IBAction func plusIconPressed(_ sender: UIButton) {
        switch sender.tag {
            case 0:
                UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.12, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.heightConstraint.constant = 170
                    let rotationTransform = CGAffineTransform(rotationAngle: .pi/4)
                    let translateTransform = CGAffineTransform(translationX: 0, y: -25)
                    
                    self.titledSnack.transform = translateTransform
                    self.titledSnack.text = "Add a SNACK"
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
                    self.titledSnack.transform = .identity
                    self.titledSnack.text = "SNACKS"
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
        
        NSLayoutConstraint.activate([titledSnack.centerXAnchor.constraint(equalTo: customNavBar.centerXAnchor),
                                     titledSnack.centerYAnchor.constraint(equalTo: customNavBar.centerYAnchor)])
    }
    
    func addImages() {
        stackOfSnacks.addArrangedSubview(oreoImage)
        stackOfSnacks.addArrangedSubview(pizzaImage)
        stackOfSnacks.addArrangedSubview(popTartsImage)
        stackOfSnacks.addArrangedSubview(popsicleImage)
        stackOfSnacks.addArrangedSubview(ramenImage)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfSnacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        cell.textLabel?.text = arrayOfSnacks[indexPath.row]
        return cell
    }
}

