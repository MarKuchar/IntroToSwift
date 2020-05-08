//
//  QuizViewController.swift
//  PersonalityQuiz
//
//  Created by Martin Kuchar on 2020-05-06.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    var questions: [Question] = [Question(text: "What kind of the following food do you like the most?", type: .single, answers: [Answer(text: "Fish", type: .japan), Answer(text: "Donut", type: .canada), Answer(text: "Cheese", type: .slovakia), Answer(text: "Beef", type: .brazil)]),
                                 Question(text: "What characteristics of people do you prefer?", type: .multiple, answers: [Answer(text: "Generosity", type: .brazil), Answer(text: "Loyalty", type: .japan), Answer(text: "Reliability", type: .slovakia), Answer(text: "Politeness", type: .canada)]),
                                 Question(text: "What temperature is the most enjoyable for you?", type: .ranged, answers: [Answer(text: "35°C", type: .brazil), Answer(text: "25°C", type: .japan), Answer(text: "20°C", type: .slovakia), Answer(text: "10°C", type: .canada)]),
                                 Question(text: "Do you like nature?", type: .ranged, answers: [Answer(text: "100%", type: .canada), Answer(text: "70%", type: .brazil), Answer(text: "40%", type: .slovakia), Answer(text: "0%", type: .japan)]),
                                 Question(text: "Do you like city?", type: .ranged, answers: [Answer(text: "100%", type: .japan), Answer(text: "70%", type: .canada), Answer(text: "40%", type: .brazil), Answer(text: "0%", type: .slovakia)]),
                                 Question(text: "What season do you want to go travel", type: .single, answers: [Answer(text: "Spring", type: .japan), Answer(text: "Autumn", type: .slovakia), Answer(text: "Winter", type: .brazil), Answer(text: "Summer", type: .canada)]),
                                 Question(text: "What is your favourite sport", type: .single, answers: [Answer(text: "Baseball", type: .japan), Answer(text: "Cycling", type: .slovakia), Answer(text: "Football", type: .brazil), Answer(text: "Hockey", type: .canada)]),
                                 Question(text: "How much do you want to spend?", type: .ranged, answers: [Answer(text: "$4000", type: .japan), Answer(text: "$3000", type: .canada), Answer(text: "$2000", type: .slovakia), Answer(text: "$1000", type: .brazil)]),
                                 Question(text: "What continent you have never visited yet??", type: .multiple, answers: [Answer(text: "North America", type: .canada), Answer(text: "Europa", type: .slovakia), Answer(text: "South America", type: .brazil), Answer(text: "Asia", type: .japan)])]
    
    var questionIndex = 0
    
    var answerChosen: [Answer] = []
    
    let btn1: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(answerSingleQuestion), for: .touchUpInside)
        btn.tag = 0
        return btn
    }()
    
    let btn2: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(answerSingleQuestion), for: .touchUpInside)
        btn.tag = 1
        return btn
    }()
    
    let btn3: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(answerSingleQuestion), for: .touchUpInside)
        btn.tag = 2
        return btn
    }()
    
    let btn4: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(answerSingleQuestion), for: .touchUpInside)
        btn.tag = 3
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
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let label3: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let label4: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let vView: UIStackView = {
        let vView = UIStackView()
        vView.translatesAutoresizingMaskIntoConstraints = false
        vView.axis = .vertical
        vView.alignment = .leading
        vView.distribution = .equalSpacing
        vView.spacing = 20
        return vView
    }()
    
    let vView2: UIStackView = {
        let vView = UIStackView()
        vView.translatesAutoresizingMaskIntoConstraints = false
        vView.axis = .vertical
        vView.alignment = .leading
        vView.distribution = .equalSpacing
        vView.spacing = 20
        return vView
    }()
    
    let vView3: UIStackView = {
        let vView = UIStackView()
        vView.translatesAutoresizingMaskIntoConstraints = false
        vView.axis = .vertical
        vView.alignment = .leading
        vView.distribution = .equalSpacing
        vView.spacing = 20
        return vView
    }()
    
    let btnSubmit: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Submit Answer", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(answerMultipleQuestion), for: .touchUpInside)
        return btn
    }()
    
    let labelSlider1: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let labelSlider2: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.widthAnchor.constraint(equalToConstant: 300).isActive = true
        slider.tintColor = .green
        slider.minimumValue = 0
        slider.maximumValue = 1
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
    
    let labelQuestion: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Current Q"
        label.numberOfLines = 4
        label.textAlignment = .center
        return label
    }()
    
    let progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.setProgress(0.5, animated: true)
        progress.trackTintColor = .gray
        progress.tintColor = .green
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
//        let nav = UINavigationController(rootViewController: self)
//        self.navigationController?.present(nav, animated: true, completion: nil)
        navigationItem.title = "Questions"
        setConstrainsQuestionLabel()
        setProggressViewConstraints()
        updateUI()
    }
    
/// Functions to add subviews
    
    func addViews() {
        view.addSubview(vView)
        
        view.addSubview(vView2)
        view.addSubview(vView3)
        view.addSubview(btnSubmit)
        
        view.addSubview(vViewSlider)
        view.addSubview(labelSlider1)
        view.addSubview(labelSlider2)
        
        view.addSubview(labelQuestion)
        view.addSubview(progressView)
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
    
    func setHorizontalStack() {
           hView.addArrangedSubview(labelSlider1)
           hView.addArrangedSubview(labelSlider2)
       }
    
/// Functions to set constrants
    
    func setConstrainsQuestionLabel() {
        NSLayoutConstraint.activate([labelQuestion.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
                                     labelQuestion.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     labelQuestion.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)])
    }
    
    func setProggressViewConstraints() {
        NSLayoutConstraint.activate([progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     progressView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
                                     progressView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)])
    }
    
/// Functions UI
    
    func setMultipleQuestionStack(answer: [Answer]) {
        vView2.isHidden = false
        vView3.isHidden = false
        btnSubmit.isHidden = false
        NSLayoutConstraint.activate([vView2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     vView2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
                                     vView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([vView3.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     vView3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
                                     vView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([btnSubmit.centerXAnchor.constraint(equalTo: view.centerXAnchor), btnSubmit.topAnchor.constraint(equalTo: vView2.bottomAnchor, constant: 20)])
        
        label1.text = answer[0].text
        label2.text = answer[1].text
        label3.text = answer[2].text
        label4.text = answer[3].text
        
        addProperties2()
    }

    func setSingleQuestionStack(answer: [Answer]) {
        vView.isHidden = false
        NSLayoutConstraint.activate([vView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     vView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
                                     vView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        btn1.setTitle(answer[0].text, for: .normal)
        btn2.setTitle(answer[1].text, for: .normal)
        btn3.setTitle(answer[2].text, for: .normal)
        btn4.setTitle(answer[3].text, for: .normal)
        
        addProperties()
    }
    
    func setSliderStack(answer: [Answer]) {
        slider.setValue(0, animated: false)
        vViewSlider.isHidden = false
        btnSubmit.isHidden = false
        NSLayoutConstraint.activate([vViewSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     vViewSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     vViewSlider.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
                                     vViewSlider.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)])
        vViewSlider.addArrangedSubview(slider)
        vViewSlider.addArrangedSubview(hView)
        labelSlider1.text = answer.last?.text
        labelSlider2.text = answer.first?.text
        setHorizontalStack()
    }
    
    func updateUI() {
        vView.isHidden = true
        vView2.isHidden = true
        vView3.isHidden = true
        vViewSlider.isHidden = true
        btnSubmit.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswer = currentQuestion.answers
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        let totalProgress = Float(questionIndex) /
                Float(questions.count)
        labelQuestion.text = currentQuestion.text
        progressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
            case .single:
                setSingleQuestionStack(answer: currentAnswer)
            case .multiple:
                setMultipleQuestionStack(answer: currentAnswer)
            case .ranged:
                setSliderStack(answer: currentAnswer)
        }
    }
    
    
/// Messenger functions
    
    @objc func answerSingleQuestion(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answers
        switch sender.tag {
            case 0:
                answerChosen.append(currentAnswer[0])
            case 1:
                answerChosen.append(currentAnswer[1])
            case 2:
                answerChosen.append(currentAnswer[2])
            case 3:
                answerChosen.append(currentAnswer[3])
            default:
                print("OTHER")
        }

        nextQuestion()
    }
    
    @objc func answerMultipleQuestion() {
        let currentAnswer = questions[questionIndex].answers
        if sbtn1.isOn {
            answerChosen.append(currentAnswer[0])
            sbtn1.isOn = false
        }
        if sbtn2.isOn {
            answerChosen.append(currentAnswer[1])
            sbtn2.isOn = false
        }
        if sbtn3.isOn {
            answerChosen.append(currentAnswer[2])
            sbtn3.isOn = false
        }
        if sbtn4.isOn {
            answerChosen.append(currentAnswer[3])
            sbtn4.isOn = false
        }
        btnSubmit.removeTarget(nil, action: nil, for: .allEvents)
        btnSubmit.addTarget(self, action: #selector(answerSliderQuestion), for: .touchUpInside)
        nextQuestion()
    }
    
    @objc func answerSliderQuestion() {
        let currentAnswer = questions[questionIndex].answers
        let index = Int(round(slider.value * Float(currentAnswer.count - 1)))
        answerChosen.append(currentAnswer[index])
        btnSubmit.removeTarget(nil, action: nil, for: .allEvents)
        btnSubmit.addTarget(self, action: #selector(answerMultipleQuestion), for: .touchUpInside)
        nextQuestion()
    }
     
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            let resultController = ResultViewController()
            resultController.responses = answerChosen
            navigationController?.pushViewController(resultController, animated: true)
        }
    }
}
