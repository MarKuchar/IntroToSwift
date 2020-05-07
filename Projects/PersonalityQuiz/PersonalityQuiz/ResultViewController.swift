//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Martin Kuchar on 2020-05-06.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    let result: UILabel = {
        let result = UILabel()
        result.text = "Next country you should go visit is:"
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    let imageView: UIImageView = {
        let image =  UIImage(named: "Slovakia")
        let imageView = UIImageView(image: image)
        NSLayoutConstraint.activate([imageView.heightAnchor.constraint(equalToConstant: 100),
                                     imageView.widthAnchor.constraint(equalToConstant: 100)])
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionOfCoutry: UILabel = {
        let description = UILabel()
        description.text = "Beautiful country in the hearth of Europe"
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    let vViewResult: UIStackView = {
        let vView = UIStackView()
        vView.translatesAutoresizingMaskIntoConstraints = false
        vView.axis = .vertical
        vView.alignment = .center
        vView.distribution = .equalSpacing
        vView.spacing = 20
        return vView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "RESULTS"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(goBack))
        
        view.addSubview(vViewResult)
        setViewResultStack()
    }
    
    @objc func goBack(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func setViewResultStack() {
        NSLayoutConstraint.activate([vViewResult.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     vViewResult.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     vViewResult.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
                                     vViewResult.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)])
        vViewResult.addArrangedSubview(result)
        vViewResult.addArrangedSubview(imageView)
        vViewResult.addArrangedSubview(descriptionOfCoutry)
    }
}
