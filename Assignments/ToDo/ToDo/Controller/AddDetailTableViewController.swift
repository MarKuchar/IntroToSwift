//
//  AddDetailTableViewController.swift
//  ToDo
//
//  Created by Martin Kuchar on 2020-05-14.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class AddDetailTableViewController: UITableViewController {
    
    @IBOutlet var taskName: UITextField!
    @IBOutlet var taskPriority: UITextField!
    @IBOutlet var taskStatus: UITextField!
    
    var delegate: AddDetailTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveTask(_ sender: UIBarButtonItem) {
        let name  = taskName.text ?? ""
        let priority = taskPriority.text ?? ""
        let status = taskStatus.text ?? ""
        
        let task = Todo(title: name, priority: Todo.priority(rawValue: 1)!, isCompleted: false)
        
        delegate?.addTask(task: task)
        dismiss(animated: true, completion: nil)
    }
}

protocol AddDetailTableViewControllerDelegate {
    func addTask(task: Todo)
}
