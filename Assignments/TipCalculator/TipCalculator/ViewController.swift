//
//  ViewController.swift
//  TipCalc lator
//
//  Created by Martin Kuchar on 2020-05-09.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tipPercentage: Double = 0
    
    @IBOutlet var billAmountTextField: UITextField!
    
    @IBOutlet var tipTextField: UILabel!
    
    @IBOutlet var tipAmountLabel: UILabel!
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBAction func calculateTip(_ sender: UIButton) {
        if let price = billAmountTextField.text, let priceDollar = Double(price) {
            tipAmountLabel.text = String(format:"Total price: $ %.1f",priceDollar + priceDollar * tipPercentage)
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
    
    
    @IBAction func adjustTipPercentage(_ sender: UISlider) {
        tipPercentage = Double(sender.value) / 100
        if let text  = billAmountTextField.text {
            if let price = Double(text) {
                tipTextField.text = String(format:"Price with tip: $ %.1f",price * tipPercentage)
                tipAmountLabel.text = String(format:"Total price: $ %.1f",price + price * tipPercentage)
            }
        }
    }
    
    @IBAction func adjustBill(_ sender: Any) {
        if let price = billAmountTextField.text, let priceDollar = Double(price) {
                     tipAmountLabel.text = String(format:"Total price: $ %.1f", tipPercentage * priceDollar + priceDollar)
        }
    }
    
    
    
}

