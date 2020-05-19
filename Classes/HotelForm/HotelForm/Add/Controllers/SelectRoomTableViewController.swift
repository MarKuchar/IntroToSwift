//
//  SelectRoomTableViewController.swift
//  HotelForm
//
//  Created by Derrick Park on 5/19/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

protocol SelectRoomTableViewControllerDelegate: class {
  func didSelect(roomType: RoomType)
}

class SelectRoomTableViewController: UITableViewController {
  
  private let cellId = "RoomTypeCell"
  weak var delegate: SelectRoomTableViewControllerDelegate?
  var roomType: RoomType?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Select Room Type"
    tableView.register(RightDetailTableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return RoomType.all.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RightDetailTableViewCell
    let roomType = RoomType.all[indexPath.row]
    
    cell.textLabel?.text = roomType.name
    cell.detailTextLabel?.text = "$ \(roomType.price)"
    cell.accessoryType = (roomType == self.roomType) ? .checkmark : .none
    return cell
  }

  // MARK: - Table view delegate
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    roomType = RoomType.all[indexPath.row]
    delegate?.didSelect(roomType: roomType!)
    tableView.reloadData()
  }
  
}
