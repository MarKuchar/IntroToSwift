//
//  AddDetailTableViewController.swift
//  ToDo
//
//  Created by Martin Kuchar on 2020-05-14.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class AddDetailTableViewController: UITableViewController {
    
    private let taskName = DetailTableViewCell(placeholder: "Add new task")
    
    var delegate: AddDetailTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add task"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save(_:)))
    }
    
    @objc func cancel(_: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @objc func save(_: UIBarButtonItem) {
        //        let name  = taskName.text ?? ""
        //        let task = Todo(title: name, priority: Todo.priority(rawValue: 1)!, isCompleted: false)
                
        //        delegate?.addTask(task: task)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTask(_ sender: UIBarButtonItem) {
//        let name  = taskName.text ?? ""
//        let task = Todo(title: name, priority: Todo.priority(rawValue: 1)!, isCompleted: false)
//        delegate?.addTask(task: task)
//        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return taskName
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}



protocol AddDetailTableViewControllerDelegate {
    func addTask(task: Todo)
}
