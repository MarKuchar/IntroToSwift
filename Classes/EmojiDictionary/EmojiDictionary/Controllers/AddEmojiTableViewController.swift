//
//  AddEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Derrick Park on 5/12/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

protocol AddEmojiTableViewControllerDelegate: class {
  func add(emoji: Emoji)
}

class AddEmojiTableViewController: UITableViewController, UITextFieldDelegate {
  
  @IBOutlet var symbolTextField: UITextField!
  @IBOutlet var nameTextField: UITextField!
  @IBOutlet var descriptionTextField: UITextField!
  @IBOutlet var usageTextField: UITextField!
  
  @IBOutlet var saveButton: UIBarButtonItem!
  
  weak var delegate: AddEmojiTableViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = 60 // static table view
    
    symbolTextField.delegate = self
    nameTextField.delegate = self
    descriptionTextField.delegate = self
    usageTextField.delegate = self
    
    updateSaveButtonState()
  }
  
  @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
  
  private func updateSaveButtonState() {
    let symbol = symbolTextField.text ?? ""
    let name = nameTextField.text ?? ""
    let description = descriptionTextField.text ?? ""
    let usage = usageTextField.text ?? ""
    
    saveButton.isEnabled = !symbol.isEmpty && !name.isEmpty && !description.isEmpty && !usage.isEmpty
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    updateSaveButtonState()
    return true
  }

  @IBAction func saveTapped(_ sender: UIBarButtonItem) {
    let symbol = symbolTextField.text ?? ""
    let name = nameTextField.text ?? ""
    let description = descriptionTextField.text ?? ""
    let usage = usageTextField.text ?? ""
    
    let newEmoji = Emoji(symbol: symbol, name: name, detailDescription: description, usage: usage)
    delegate?.add(emoji: newEmoji)
    dismiss(animated: true, completion: nil)
  }
  
}
