//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by Martin Kuchar on 2020-05-05.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let start: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Begin Personality Quiz", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let quizTittle: UILabel = {
        let tittle = UILabel()
        tittle.translatesAutoresizingMaskIntoConstraints = false
        tittle.text =  "What country you should visit to next?"
        tittle.textAlignment = .center
        return tittle
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    let svkImage: UIImageView! = {
        let imageSlovakia = UIImage(named: "Slovakia")
        let svk = UIImageView(image: imageSlovakia)
        svk.translatesAutoresizingMaskIntoConstraints = false
        return svk
    }()
    
    let caImage: UIImageView! = {
        let imageCanada = UIImage(named: "Canada")
        let ca = UIImageView(image: imageCanada)
        ca.translatesAutoresizingMaskIntoConstraints = false
        return ca
    }()
    
    let brImage: UIImageView! = {
        let imageBrazil = UIImage(named: "Brazil")
        let ba = UIImageView(image: imageBrazil)
        ba.translatesAutoresizingMaskIntoConstraints = false
        return ba
    }()
    
    let jpImage: UIImageView! = {
        let imageJapan = UIImage(named: "Japan")
        let jp = UIImageView(image: imageJapan)
        jp.translatesAutoresizingMaskIntoConstraints = false
        return jp
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setConstraints()
        
        start.addTarget(self, action: #selector(beginQuiz), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    func addViews() {
        view.addSubview(stackView)
        view.addSubview(svkImage)
        view.addSubview(caImage)
        view.addSubview(brImage)
        view.addSubview(jpImage)
        stackView.addArrangedSubview(quizTittle)
        stackView.addArrangedSubview(start)
    }
    
    @objc func beginQuiz(_ sender: UIButton) {
        let questionView = QuizViewController()
        navigationController?.pushViewController(questionView, animated: true)
//        questionView.modalPresentationStyle = .fullScreen
//        self.present(questionView, animated: true, completion: nil)
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     stackView.widthAnchor.constraint(equalToConstant: 200),
                                     stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
                                     quizTittle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)])
        
        NSLayoutConstraint.activate([svkImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                                     svkImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
                                     svkImage.heightAnchor.constraint(equalToConstant: 55),
                                     svkImage.widthAnchor.constraint(equalToConstant: 55)])
        
        NSLayoutConstraint.activate([caImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                                     caImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
                                     caImage.heightAnchor.constraint(equalToConstant: 55),
                                     caImage.widthAnchor.constraint(equalToConstant: 55)])
        
        NSLayoutConstraint.activate([brImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                                     brImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
                                     brImage.heightAnchor.constraint(equalToConstant: 55),
                                     brImage.widthAnchor.constraint(equalToConstant: 55)])
        
        NSLayoutConstraint.activate([jpImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                                     jpImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
                                     jpImage.heightAnchor.constraint(equalToConstant: 55),
                                     jpImage.widthAnchor.constraint(equalToConstant: 55)])
    }
    
    
}

