//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Martin Kuchar on 2020-05-06.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var responses: [Answer]!

    let result: UILabel = {
        let result = UILabel()
        result.text = "Next country you should go visit is:"
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        NSLayoutConstraint.activate([imageView.heightAnchor.constraint(equalToConstant: 100),
                                     imageView.widthAnchor.constraint(equalToConstant: 100)])
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionOfCoutry: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 10
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
        calculatePersonalityResult()
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
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [Answer.CountryType: Int] = [:]
        let responseTypes = responses.map { $0.type }
        for response in responseTypes {
            let newCount: Int
            if let oldCount = frequencyOfAnswers[response] {
                newCount = oldCount + 1
            } else {
                newCount = 1
            }
            frequencyOfAnswers[response] = newCount
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 >
        $1.1 }.first!.key
        
        imageView.image = mostCommonAnswer.image
        descriptionOfCoutry.text = mostCommonAnswer.definition
    }
}
