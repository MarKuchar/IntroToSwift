//
//  TodoTableViewController.swift
//  ToDo
//
//  Created by Martin Kuchar on 2020-05-13.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit
import CoreData

class TodoTableViewController: FetchedResultsTableViewController, AddDetailTableViewControllerDelegate {
  
  // Using Fetch Result Controller
  lazy var frc: NSFetchedResultsController<ManagedToDo> = {
    let request: NSFetchRequest<ManagedToDo> = ManagedToDo.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))]
    let frc = NSFetchedResultsController<ManagedToDo>(
      fetchRequest: request,
      managedObjectContext: container!.viewContext,
      sectionNameKeyPath: "priority",
      cacheName: nil
    )
    frc.delegate = self
    return frc
  }()
  
  var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
  
  override func viewWillAppear(_ animated: Bool) {
    updateUI()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = editButtonItem
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 50
    tableView.allowsMultipleSelectionDuringEditing = true
  }
  
  private func updateUI() {
    try? frc.performFetch()
    tableView.reloadData()
  }
  
  @IBAction func multipleDeletion(_ sender: Any) {
    if let selectedRows = tableView.indexPathsForSelectedRows {
      for path in selectedRows {
        let commit = frc.object(at: path)
        frc.managedObjectContext.delete(commit)
      }
      try? frc.managedObjectContext.save()
    }
  }
  
  @IBAction func addNewTask(_ sender: Any) {
    let newTask = AddDetailTableViewController(style: .grouped)
    let embedNewTask = UINavigationController(rootViewController: newTask)
    newTask.delegate = self
    present(embedNewTask, animated: true, completion: nil)
  }
  
  func addTask(task: Todo) {
    let managedTask = ManagedToDo(context: frc.managedObjectContext)
    managedTask.title = task.title
    managedTask.priority = Int32(task.priority.rawValue)
    managedTask.isCompleted = false
    print(managedTask.priority)
    try? managedTask.managedObjectContext?.save()
    dismiss(animated: true)
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return frc.sections?.count ?? 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let sections = frc.sections, sections[section].numberOfObjects > 0 {
      return sections[section].numberOfObjects
    } else {
      return 0
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
    let todo = frc.object(at: indexPath)
    
    cell.taskLabel?.text = todo.title
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
  
  override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    if isEditing {
      return
    }
    let title = frc.object(at: indexPath).title
    let detailView = AddDetailTableViewController(style: .grouped)
    let embedDetaiView = UINavigationController(rootViewController: detailView)
    
    detailView.taskTitle = title
    present(embedDetaiView, animated: true, completion: nil)
  }
  
  // MARK: - Table view delegate
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if !isEditing {
      tableView.deselectRow(at: indexPath, animated: true)
    }
    if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
      tableView.cellForRow(at: indexPath)?.accessoryType = .detailDisclosureButton
    } else {
      tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      frc.managedObjectContext.delete(frc.object(at: indexPath))
      try? frc.managedObjectContext.save()
    }
  }
  
  override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    tableView.cellForRow(at: sourceIndexPath)?.accessoryType = .none

    let managedTask = ManagedToDo(context: frc.managedObjectContext)
    managedTask.priority = Int32(destinationIndexPath.section - 1)
    managedTask.title = frc.object(at: sourceIndexPath).title
    managedTask.isCompleted = frc.object(at: sourceIndexPath).isCompleted
    
    frc.managedObjectContext.delete(frc.object(at: sourceIndexPath))
    try? frc.managedObjectContext.save()
  }
  
  override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
//    print(sourceIndexPath)
//    print(proposedDestinationIndexPath)
    return sourceIndexPath
  }
}

