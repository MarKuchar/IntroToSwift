//
//  AddDetailTableViewController.swift
//  ToDo
//
//  Created by Martin Kuchar on 2020-05-14.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit
import CoreData

class AddDetailTableViewController: UITableViewController {
    
    var taskName = DetailTableViewCell(placeholder: "Add new task")
    
    var delegate: AddDetailTableViewControllerDelegate?
    
    var managedTask: ManagedToDo?
    
    var taskTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add task"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save(_:)))
        updateTask()
    }
    
    func updateTask() {
        guard let taskTitle = taskTitle else { return }
        taskName.textField.text = taskTitle
    }
    
    @objc func cancel(_: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @objc func save(_: UIBarButtonItem) {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        if let entity =  NSEntityDescription.entity(forEntityName: "ManagedToDo", in: managedContext) {
            managedTask = ManagedToDo(entity: entity, insertInto: managedContext)
            managedTask?.title = taskName.textField.text ?? ""
            managedTask?.priority = Int32(Todo.priority.low.rawValue)
            managedTask?.isCompleted = false
            if let mTask = managedTask {
               delegate?.addTask(task: mTask)
           }
        }
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
    func addTask(task: ManagedToDo)
}
