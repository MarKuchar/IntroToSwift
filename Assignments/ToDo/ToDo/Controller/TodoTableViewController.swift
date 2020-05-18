//
//  TodoTableViewController.swift
//  ToDo
//
//  Created by Martin Kuchar on 2020-05-13.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController, AddDetailTableViewControllerDelegate {
    
//    var indexNumber: NSInteger = -1

    var todoObjects: [Todo] = [
        Todo(title: "Study", priority: .heigh, isCompleted: true),
        Todo(title: "Read a book", priority: .low, isCompleted: false),
        Todo(title: "Think about the app", priority: .medium, isCompleted: false),
        Todo(title: "Do personal project", priority: .medium, isCompleted: true)
    ]
    
    var sectionSelection: [Priority] = [
        Priority(tasks: [Todo(title: "Study", priority: .heigh, isCompleted: true)]),
        Priority(tasks: [Todo(title: "Think about app Think about app Think about app Think about app Think about app Think about app", priority: .medium, isCompleted: false),
        Todo(title: "Do personal project", priority: .medium, isCompleted: true)]),
        Priority(tasks: [Todo(title: "Read a book", priority: .low, isCompleted: false)])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.allowsMultipleSelectionDuringEditing = true
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "foodCell")
    }
   
    
    @IBAction func multipleDeletion(_ sender: Any) {
        if let selectedRows = tableView.indexPathsForSelectedRows {
        for path in selectedRows {
            sectionSelection[path.section].tasks.remove(at: path.row)
        }
        tableView.beginUpdates()
        tableView.deleteRows(at: selectedRows, with: .automatic)
        tableView.endUpdates()
        }
    }
    
    @IBAction func addNewTask(_ sender: Any) {
        let newTask = AddDetailTableViewController(style: .grouped)
        let embedNewTask = UINavigationController(rootViewController: newTask)
        present(embedNewTask, animated: true, completion: nil)
        newTask.delegate = self
    }
    
    func addTask(task: Todo) {
        sectionSelection[0].tasks.append(task)
        tableView.insertRows(at: [IndexPath(row: sectionSelection[0].tasks.count - 1, section: 0)], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print(indexPath)
        
//        let title = sectionSelection[indexPath.section].tasks[indexPath.row].title
//        let detailView = AddDetailTableViewController(style: .grouped)
//        let embedDetaiView = UINavigationController(rootViewController: detailView)
//
//        detailView.taskTitle = title
//        present(embedDetaiView, animated: true, completion: nil)
    }  

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionSelection.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionSelection[section].tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
        let task = sectionSelection[indexPath.section].tasks[indexPath.row]
        cell.taskLabel?.text = task.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 2:
                return "Low priority"
            case 1:
                return "Medium priority"
            case 0:
                return "Heigh priority"
            default:
                return "NONE"
        }
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .detailDisclosureButton
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
             sectionSelection[indexPath.section].tasks.remove(at: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        tableView.cellForRow(at: sourceIndexPath)?.accessoryType = .none
        let taskToMove = sectionSelection[sourceIndexPath.section].tasks.remove(at: sourceIndexPath.row)
        sectionSelection[destinationIndexPath.section].tasks.insert(taskToMove, at: destinationIndexPath.row)
        tableView.reloadData()
    }
}
