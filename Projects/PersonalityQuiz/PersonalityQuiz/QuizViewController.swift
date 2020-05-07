//
//  QuizViewController.swift
//  PersonalityQuiz
//
//  Created by Martin Kuchar on 2020-05-06.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {


    let btn1: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Button", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = 1
        return btn
    }()
    
    let btn2: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Button", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let btn3: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Button", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let btn4: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Button", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let sbtn1: UISwitch = {
        let btn = UISwitch()
       btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
       }()
       
    let sbtn2: UISwitch = {
       let btn = UISwitch()
       btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()

    let sbtn3: UISwitch = {
       let btn = UISwitch()
       btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()

    let sbtn4: UISwitch = {
       let btn = UISwitch()
       btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()
    
    let label3: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()
    
    let label4: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()
    
    let vView: UIStackView = {
        let vView = UIStackView()
        vView.translatesAutoresizingMaskIntoConstraints = false
        vView.axis = .vertical
        vView.alignment = .center
        vView.distribution = .equalSpacing
        vView.spacing = 20
        return vView
    }()
    
    let vView2: UIStackView = {
        let vView = UIStackView()
        vView.translatesAutoresizingMaskIntoConstraints = false
        vView.axis = .vertical
        vView.alignment = .center
        vView.distribution = .equalSpacing
        vView.spacing = 20
        return vView
    }()
    
    let vView3: UIStackView = {
        let vView = UIStackView()
        vView.translatesAutoresizingMaskIntoConstraints = false
        vView.axis = .vertical
        vView.alignment = .center
        vView.distribution = .equalSpacing
        vView.spacing = 20
        return vView
    }()
    
    let btnSubmit: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Submit Answer", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = 2
        return btn
    }()
    
    let labelSlider1: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()
    
    let labelSlider2: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.widthAnchor.constraint(equalToConstant: 300).isActive = true
        slider.tintColor = .green
        return slider
    }()
    
    let hView: UIStackView = {
        let hView = UIStackView()
        hView.translatesAutoresizingMaskIntoConstraints = false
        hView.axis = .horizontal
        hView.alignment = .center
        hView.distribution = .equalSpacing
        hView.spacing = 250
        return hView
    }()
    
    let vViewSlider: UIStackView = {
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
//        let nav = UINavigationController(rootViewController: self)
//        self.navigationController?.present(nav, animated: true, completion: nil)
        navigationItem.title = "Questions"
        view.addSubview(vView)
        btn1.addTarget(self, action: #selector(uninstall), for: .touchUpInside)
        btnSubmit.addTarget(self, action: #selector(uninstall), for: .touchUpInside)
        setSingleQuestionStack(vView)
        addProperties()
    }
    
    func addProperties() {
        vView.addArrangedSubview(btn1)
        vView.addArrangedSubview(btn2)
        vView.addArrangedSubview(btn3)
        vView.addArrangedSubview(btn4)
    }
    
    func addProperties2() {
        vView2.addArrangedSubview(sbtn1)
        vView2.addArrangedSubview(sbtn2)
        vView2.addArrangedSubview(sbtn3)
        vView2.addArrangedSubview(sbtn4)
        vView3.addArrangedSubview(label1)
        vView3.addArrangedSubview(label2)
        vView3.addArrangedSubview(label3)
        vView3.addArrangedSubview(label4)
    }
    
    func setMultipleQuestionStack() {
        NSLayoutConstraint.activate([vView2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     vView2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
                                     vView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([btnSubmit.centerXAnchor.constraint(equalTo: view.centerXAnchor), btnSubmit.topAnchor.constraint(equalTo: vView2.bottomAnchor, constant: 20)])
    }

    func setSingleQuestionStack(_ sView: UIStackView) {
        NSLayoutConstraint.activate([sView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     sView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
                                     sView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    func setHorizontalStack() {
        hView.addArrangedSubview(labelSlider1)
        hView.addArrangedSubview(labelSlider2)
    }
    
    func setSliderStack() {
        NSLayoutConstraint.activate([vViewSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     vViewSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     vViewSlider.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
                                     vViewSlider.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)])
        vViewSlider.addArrangedSubview(slider)
        vViewSlider.addArrangedSubview(hView)
        vViewSlider.addArrangedSubview(btnSubmit)
    }
    
    @objc func uninstall(_ sender: UIButton) {
        switch sender.tag {
            case 1:
                vView.removeFromSuperview()
                view.addSubview(vView2)
                view.addSubview(vView3)
                view.addSubview(btnSubmit)
                setSingleQuestionStack(vView3)
                setMultipleQuestionStack()
                addProperties2()
        
            case 2:
                vView2.removeFromSuperview()
                vView3.removeFromSuperview()
                view.addSubview(vViewSlider)
                setHorizontalStack()
                setSliderStack()
            default:
                print("OTHER")
        }
    }
}
