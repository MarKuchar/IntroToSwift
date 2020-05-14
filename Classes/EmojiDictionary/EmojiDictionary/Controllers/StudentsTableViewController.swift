//
//  StudentsTableViewController.swift
//  EmojiDictionary
//
//  Created by Derrick Park on 5/12/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {
  
  var students = [
    "Jiro", "Leandro", "Hermilo", "Martin", "Tomona", "Melisa", "Carlos", "Aga", "Cayo"
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Student List"
    // You need to register a cell when you're using table view controller in code
    tableView.register(EmojiTableViewCell.self, forCellReuseIdentifier: "StudentCell")
  }
  
  // MARK: - Table view data source
 
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return students.count
  }
 
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! EmojiTableViewCell
    cell.textLabel?.text = students[indexPath.row]
    return cell
  }

}
