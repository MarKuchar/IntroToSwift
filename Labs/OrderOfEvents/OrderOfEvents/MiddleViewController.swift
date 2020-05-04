//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Martin Kuchar on 2020-05-04.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {
    
    @IBOutlet var label1: UILabel!
    
    var eventNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentText = label1.text {
        label1.text = "\(currentText)\n\(eventNumber). was viewDidLoad"
        eventNumber += 1
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        if let currentText = label1.text {
            label1.text = "\(currentText)\n\(eventNumber). was viewWillAppear"
            eventNumber += 1
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
        super.viewDidAppear(animated)
        if let text = label1.text {
            label1.text = "\(text)\n\(eventNumber). was viewDidAppear"
            eventNumber += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
        super.viewWillDisappear(animated)
        if let text = label1.text {
            label1.text = "\(text)\n\(eventNumber). was viewWillDisappear"
            eventNumber += 1
        }

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
        super.viewDidDisappear(animated)
        if let text = label1.text {
            label1.text = "\(text)\n\(eventNumber). was viewDidDisappear"
            eventNumber += 1
        }

    }
}
