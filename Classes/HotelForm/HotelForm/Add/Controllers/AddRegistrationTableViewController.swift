//
//  AddRegistrationTableViewController.swift
//  HotelForm
//
//  Created by Derrick Park on 5/15/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTableViewControllerDelegate {
  
  private let firstNameCell = TextFieldTableViewCell(placeholder: "First Name")
  private let lastNameCell = TextFieldTableViewCell(placeholder: "Last Name")
  private let emailCell = TextFieldTableViewCell(placeholder: "Email Name")
  private let checkInCell = DateLabelTableViewCell(title: "Check-In Date")
  private let checkInDatePickerCell = DatePickerTableViewCell()
  private let checkOutCell = DateLabelTableViewCell(title: "Check-Out Date")
  private let checkOutDatePickerCell = DatePickerTableViewCell()
  private let adultGuestCell = StepperTableViewCell(guestType: "Adults")
  private let childGuestCell = StepperTableViewCell(guestType: "Children")
  private let wifiCell = SwitchTableViewCell(category: "Wi-Fi (per day)")
  private let roomTypeCell: RightDetailTableViewCell = {
    let cell = RightDetailTableViewCell()
    cell.textLabel?.text = "Room Type"
    cell.accessoryType = .disclosureIndicator
    return cell
  }()
  
  private var isCheckInDatePickerShown: Bool = false {
    didSet {
      checkInDatePickerCell.datePicker.isHidden = !isCheckInDatePickerShown
    }
  }
  
  private var isCheckOutDatePickerShown: Bool = false {
    didSet {
      checkOutDatePickerCell.datePicker.isHidden = !isCheckOutDatePickerShown
    }
  }
  
  private var roomType: RoomType?
  
  var registration: Registration?
  var editIndex: Int?
  var addRegistration: ((Registration) -> ())?
  var editRegistration: ((Registration, Int) -> ())?
  
  deinit {
    print("AddRegistrationTableViewController deinitialized")
  }
  
  private func updateCells(registration: Registration) {
    firstNameCell.textStr = registration.firstName
    lastNameCell.textStr = registration.lastName
    emailCell.textStr = registration.emailAddress
    checkInDatePickerCell.datePicker.date = registration.checkInDate
    checkOutDatePickerCell.datePicker.date = registration.checkOutDate
    adultGuestCell.numberOfGuests = registration.numberOfAdults
    childGuestCell.numberOfGuests = registration.numberOfChildren
    wifiCell.isOn = registration.wifi
    roomType = registration.roomType
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let registration = registration {
      navigationItem.title = "Edit Guest Registration"
      updateCells(registration: registration)
    } else {
      navigationItem.title = "New Guest Registration"
    }
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped(_:)))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped(_:)))
    
    checkInDatePickerCell.datePickerValueChanged = { [unowned self] in
      self.updateDateViews()
    }
    checkOutDatePickerCell.datePickerValueChanged = { [weak self] in
      self?.updateDateViews()
    }
    
    updateDateViews()
    updateRoomType()
  }
  
  private func updateDateViews() {
    checkInDatePickerCell.datePicker.minimumDate = Date()
    checkOutDatePickerCell.datePicker.minimumDate = checkInDatePickerCell.datePicker.date.addingTimeInterval(86400) // 24 hours in seconds
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    
    checkInCell.detailTextLabel?.text = dateFormatter.string(from: checkInDatePickerCell.datePicker.date)
    checkOutCell.detailTextLabel?.text = dateFormatter.string(from: checkOutDatePickerCell.datePicker.date)
  }
  
  private func updateRoomType() {
    if let roomType = self.roomType {
      roomTypeCell.detailTextLabel?.text = roomType.name
    } else {
      roomTypeCell.detailTextLabel?.text = "Not Set"
    }
  }
  
  func didSelect(roomType: RoomType) {
    self.roomType = roomType
    updateRoomType()
  }
  
  @objc func cancelTapped(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
  
  @objc func doneTapped(_ sender: UIBarButtonItem) {
    guard let roomType = self.roomType else { return }
    let firstName = firstNameCell.textStr ?? ""
    let lastName = lastNameCell.textStr ?? ""
    let email = emailCell.textStr ?? ""
    let checkInDate = checkInDatePickerCell.datePicker.date
    let checkOutDate = checkOutDatePickerCell.datePicker.date
    let numOfAdults = adultGuestCell.numberOfGuests
    let numOfChildren = childGuestCell.numberOfGuests
    let hasWifi = wifiCell.isOn
    let newRegistration = Registration(firstName: firstName,
                                       lastName: lastName,
                                       emailAddress: email,
                                       checkInDate: checkInDate,
                                       checkOutDate: checkOutDate,
                                       numberOfAdults: numOfAdults,
                                       numberOfChildren: numOfChildren, roomType: roomType, wifi: hasWifi)
    if let index = editIndex {
      // edit
      editRegistration?(newRegistration, index)
    } else {
      
      // using closure pass the new registration back to RegistrationTVC
      addRegistration?(newRegistration)
    }
    // dismiss the view controller
    dismiss(animated: true, completion: nil)
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 5
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
      case 0:
        return 3
      case 1:
        return 4
      case 2:
        return 2
      case 3:
        return 1
      case 4:
        return 1
      default:
        return 0
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch (indexPath.section, indexPath.row) {
      case (0, 0):
        return firstNameCell
      case (0, 1):
        return lastNameCell
      case (0, 2):
        return emailCell
      case (1, 0):
        return checkInCell
      case (1, 1):
        return checkInDatePickerCell
      case (1, 2):
        return checkOutCell
      case (1, 3):
        return checkOutDatePickerCell
      case (2, 0):
        return adultGuestCell
      case (2, 1):
        return childGuestCell
      case (3, 0):
        return wifiCell
      default:
        return roomTypeCell
    }
  }
  
  // MARK: - Table view delegate
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch (indexPath.section, indexPath.row) {
      case (1, 1):
        return isCheckInDatePickerShown ? 216 : 0
      case (1, 3):
        return isCheckOutDatePickerShown ? 216 : 0
      default:
        return 44.0
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    switch (indexPath.section, indexPath.row) {
      case (1, 0):
        //        if isCheckInDatePickerShown {
        //          isCheckInDatePickerShown = false
        //        } else if isCheckOutDatePickerShown {
        //          isCheckOutDatePickerShown = false
        //          isCheckInDatePickerShown = true
        //        } else {
        //          isCheckInDatePickerShown = true
        //        }
        isCheckInDatePickerShown = !isCheckInDatePickerShown
        isCheckOutDatePickerShown = false
      case (1, 2):
        isCheckOutDatePickerShown = !isCheckOutDatePickerShown
        isCheckInDatePickerShown = false
      case (4, 0):
        let selectRoomTVC = SelectRoomTableViewController()
        selectRoomTVC.delegate = self
        navigationController?.pushViewController(selectRoomTVC, animated: true)
      default:
        break
    }
    /// Update the table view with a pair of beginUpdates and EndUpdates calls
    /// These calls tell the table view to re-query its attributes - including cell height
    tableView.beginUpdates()
    tableView.endUpdates()
    
  }
}
