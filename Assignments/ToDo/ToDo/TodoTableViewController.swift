//
//  TodoTableViewController.swift
//  ToDo
//
//  Created by Martin Kuchar on 2020-05-13.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    let todoObjects: [Todo] = [
        Todo(title: "Study programming", priority: .heigh, isCompleted: true),
        Todo(title: "Read a book", priority: .low, isCompleted: false),
        Todo(title: "Think about the app", priority: .medium, isCompleted: false),
        Todo(title: "Do personal project", priority: .medium, isCompleted: true)
    ]
    
    let sectionSelection: [Priority] = [
        Priority(tasks: [Todo(title: "Study programming", priority: .heigh, isCompleted: true)]),
        Priority(tasks: [Todo(title: "Think about app", priority: .medium, isCompleted: false),
        Todo(title: "Do personal project", priority: .medium, isCompleted: true)]),
        Priority(tasks: [Todo(title: "Read a book", priority: .low, isCompleted: false)])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionSelection.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionSelection[section].tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
        let task = sectionSelection[indexPath.section].tasks[indexPath.row]
        cell.taskLabel.text = task.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch todoObjects[section].priority {
            case .low:
                return "Low priority"
            case .medium:
                return "Medium priority"
            case .heigh:
                return "Heigh priority"
        }
    }
}
