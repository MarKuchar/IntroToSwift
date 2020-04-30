//
//  ViewController.swift
//  SegueBetweenScreen_Login
//
//  Created by Martin Kuchar on 2020-04-30.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userNameField: UITextField!
    @IBOutlet var forgotUserName: UIButton!
    @IBOutlet var forgotPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        performSegue(withIdentifier: "forgotPasswordOrUsername", sender: forgotPassword)
    }
    
    @IBAction func forgotUsernameAction(_ sender: Any) {
        performSegue(withIdentifier: "forgotPasswordOrUsername", sender: forgotUserName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {
            return
        }
        if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUserName {
            segue.destination.navigationItem.title = "Forgot User Name"
        } else {
            segue.destination.navigationItem.title = userNameField.text
        }
    }
}
