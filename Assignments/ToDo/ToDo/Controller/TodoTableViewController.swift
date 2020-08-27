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
    
//    var todos: [[ToDoManagedObject]] = []
//    var allTodos = [Todo]()
    
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
  
  
//  @IBAction func multipleDeletion(_ sender: Any) {
//    if let selectedRows = tableView.indexPathsForSelectedRows {
//        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
//        for path in selectedRows {
//            let todo = todos[path.section].remove(at: path.row)
//            managedContext.delete(todo)
//        }
//      tableView.deleteRows(at: selectedRows, with: .automatic)
//      CoreDataManager.shared.saveContext()
//    }
//  }
  
  @IBAction func addNewTask(_ sender: Any) {
    let newTask = AddDetailTableViewController(style: .grouped)
    let embedNewTask = UINavigationController(rootViewController: newTask)
    newTask.delegate = self
    present(embedNewTask, animated: true, completion: nil)
  }
  
  func addTask(task: ManagedToDo) {
    self.frc.indexPath(forObject: task)
    CoreDataManager.shared.saveContext()
    dismiss(animated: true) {
    }
}

//  override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//    if isEditing {
//        return
//    }
//    let title = todos[indexPath.section][indexPath.row].title
//    let detailView = AddDetailTableViewController(style: .grouped)
//    let embedDetaiView = UINavigationController(rootViewController: detailView)
//
//    detailView.taskTitle = title
//    present(embedDetaiView, animated: true, completion: nil)
//  }
    
    // MARK:- DataCore methods
    
    private func fetchTodos() {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ManagedToDo>(entityName: "ToDoManagedObject")
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \ManagedToDo.priority, ascending: true), NSSortDescriptor(keyPath: \ManagedToDo.isCompleted, ascending: false)]
        do {
            let todos = try managedContext.fetch(fetchRequest)
            var todosList = [[ManagedToDo]](repeating: [ManagedToDo](), count: 3)
            for todo in todos {
//                switch todo.priority {
//                    case Todo.priority.high.rawValue:
//                        todosList[0].append(todo)
//                    case Todo.priority.medium.rawValue:
//                        todosList[1].append(todo)
//                    case Todo.priority.low.rawValue:
//                        todosList[2].append(todo)
//                    default:
//                        todosList[1].append(todo)
//                }
            }
//            self.todos = todosList
            tableView.reloadData()
        } catch let err {
            print("failed to fetch todos: \(err)")
        }
    }
    
//    private func saveTodo(task: Todo) {
//        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
//        if let newTodo = try? ToDoManagedObject.findOrCreateTodo(matching: task, in: managedContext) {
//            managedContext.insert(newTodo)
//        }
//
//        dismiss(animated: true) {
//            let insertPath = IndexPath(row: 0, section: 1)
////            self.tableView.reloadData()
//            self.tableView.insertRows(at: [insertPath], with: .automatic)
//        }
//        CoreDataManager.shared.saveContext()
//    }
    
//    private func updateDatabase() {
//        container?.performBackgroundTask { (contex) in
//            for todo in self.todos {
////                _ = try? ToDoManagedObject.findOrCreateTodo(matching: todo, in: contex)
//            }
//            try? contex.save()
//        }
//    }
    
  
    // MARK: - Table view data source
  
override func numberOfSections(in tableView: UITableView) -> Int {
  return frc.sections?.count ?? 1
}
    
//  override func numberOfSections(in tableView: UITableView) -> Int {
//    return 3
//  }
  
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
    print(todo)
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
  
//  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//    if editingStyle == .delete {
//        todos[indexPath.section].remove(at: indexPath.row)
//      tableView.deleteRows(at: [indexPath], with: .automatic)
//    }
//  }
  
//  override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//    tableView.cellForRow(at: sourceIndexPath)?.accessoryType = .none
//
//    let taskToMove = todos[sourceIndexPath.section].remove(at: sourceIndexPath.row)
//    taskToMove.priority = Todo.priority.low.rawValue
//    print(taskToMove)
//
//    let managedContext = CoreDataManager.shared.persistentContainer.viewContext
//
//    managedContext.delete(taskToMove)
//
//    todos[destinationIndexPath.section].insert(taskToMove, at: destinationIndexPath.row)
//    updateDatabase()
//    tableView.reloadData()
//  }
}

