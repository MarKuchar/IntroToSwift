//
//  ViewController.swift
//  Lab - Single interaction
//
//  Created by Martin Kuchar on 2020-04-23.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var text: UITextField!
    
    @IBOutlet var setText: UIButton!
    
    @IBOutlet var clearText: UIButton!
    
    @IBOutlet var displayText: UILabel!
    
    @IBAction func setTextAction(_ sender: Any) {
        self.displayText.text = text.text
    }
    
    @IBAction func clearTextAction(_ sender: Any) {
        displayText.text = ""
        text.text = ""
    }
    
}

