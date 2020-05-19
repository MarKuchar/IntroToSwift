//
//  RegistrationTableViewController.swift
//  HotelForm
//
//  Created by Derrick Park on 5/15/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
  
  private let cellId = "RegistrationCell"
  
  private var registrations = [Registration]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "Registrations"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addRegistration(_:)))
    tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  private func addNew(registration: Registration) {
    registrations.append(registration)
    tableView.insertRows(at: [IndexPath(row: registrations.count - 1, section: 0)], with: .automatic)
  }
  
  private func edit(registration: Registration, index: Int) {
    registrations.remove(at: index)
    registrations.insert(registration, at: index)
    tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
  }
  
  @objc func addRegistration(_ sender: UIBarButtonItem) {
    let addRegistrationTVC = AddRegistrationTableViewController(style: .grouped)
    let embedNav = UINavigationController(rootViewController: addRegistrationTVC)
    addRegistrationTVC.addRegistration = addNew
    
    present(embedNav, animated: true, completion: nil)
  }
  
  // MARK: - Table view data source

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return registrations.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SubtitleTableViewCell
    let registration = registrations[indexPath.row]
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    
    cell.textLabel?.text = "\(registration.firstName) \(registration.lastName)"
    cell.detailTextLabel?.text = "\(dateFormatter.string(from: registration.checkInDate)) - \(dateFormatter.string(from: registration.checkOutDate)): \(registration.roomType.name)"
    return cell
  }
  
  // MARK: - Table view delegate

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let addRegistrationTVC = AddRegistrationTableViewController(style: .grouped)
    let embedNav = UINavigationController(rootViewController: addRegistrationTVC)
    addRegistrationTVC.editIndex = indexPath.row
    addRegistrationTVC.registration = registrations[indexPath.row]
    addRegistrationTVC.editRegistration = edit
    present(embedNav, animated: true, completion: nil)
  }
  
}
