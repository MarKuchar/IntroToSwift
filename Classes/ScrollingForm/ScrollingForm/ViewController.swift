//
//  ViewController.swift
//  ScrollingForm
//
//  Created by Derrick Park on 5/8/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var firstnameTF: UITextField!
  @IBOutlet var scrollView: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    registerForKeyboardNotification()
  }

  private func registerForKeyboardNotification() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }

  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    firstnameTF.resignFirstResponder()
  }
  
  @objc func keyboardWasShown(_ notification: Notification) {
    // 1. get the size of the keyboard
    guard let info = notification.userInfo, let keyboardFrame = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
    let keyboardHeight = keyboardFrame.cgRectValue.size.height
    // 2. scroll scrollview's content up
    let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
    scrollView.contentInset = contentInsets
    scrollView.scrollIndicatorInsets = contentInsets
  }
  
  @objc func keyboardWillBeHidden(_ notification: Notification) {
    scrollView.contentInset = UIEdgeInsets.zero
    scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
  }
}

