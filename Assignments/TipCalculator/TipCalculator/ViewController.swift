//
//  ViewController.swift
//  TipCalc lator
//
//  Created by Martin Kuchar on 2020-05-09.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tipPercentage = 0.15
    @IBOutlet var billAmountTextField: UITextField!
    
    @IBOutlet var tipPercentageTextField: UITextField!
    
    @IBOutlet var tipAmountLabel: UILabel!
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBAction func calculateTip(_ sender: UIButton) {
        if let tip = tipPercentageTextField.text {
            if let percentage = Double(tip) {
            tipPercentage = percentage / 100
            }
        }
        
        if let text  = billAmountTextField.text {
            if let price = Double(text) {
                self.tipAmountLabel.text = "$ \(price * tipPercentage)"
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerKeyboardNotification()
    }
    
    func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
   @objc func keyboardWasShown(_ notification: Notification) {
    guard let info = notification.userInfo, let frame = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
    
    let hegiht = frame.cgRectValue.size.height
    scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: hegiht, right: 0)
    }


}

