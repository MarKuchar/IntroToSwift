//
//  ViewController.swift
//  EmojiDictionary
//
//  Created by Derrick Park on 5/11/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet var tableView: UITableView!
  
//  var students: [String] = [
//    "Cayo", "Aga", "Hermilo", "Tomona", "Leandro", "Melisa", "Carlos", "Martin", "Jiro"
//  ]
  
  var emojis: [Emoji] = [
    Emoji(symbol: "😀", name: "Grinning Face", detailDescription: "A typical smiley face.", usage: "happiness"),
    Emoji(symbol: "😕", name: "Confused Face", detailDescription: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
    Emoji(symbol: "😍", name: "Heart Eyes", detailDescription: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
    Emoji(symbol: "👮", name: "Police Officer", detailDescription: "A police officer wearing a blue cap with a gold badge. He is smiling, and eager to help.", usage: "person of authority"),
    Emoji(symbol: "🐢", name: "Turtle", detailDescription: "A cute turtle.", usage: "Something slow"),
    Emoji(symbol: "🐘", name: "Elephant", detailDescription: "A gray elephant.", usage: "good memory"),
    Emoji(symbol: "🍝", name: "Spaghetti", detailDescription: "A plate of spaghetti.", usage: "spaghetti"),
    Emoji(symbol: "🎲", name: "Die", detailDescription: "A single die.", usage: "taking a risk, chance; game"),
    Emoji(symbol: "⛺️", name: "Tent", detailDescription: "A small tent.", usage: "camping"),
    Emoji(symbol: "📚", name: "Stack of Books", detailDescription: "Three colored books stacked on each other.", usage: "homework, studying"),
    Emoji(symbol: "💔", name: "Broken Heart", detailDescription: "A red, broken heart.", usage: "extreme sadness"),
    Emoji(symbol: "💤", name: "Snore", detailDescription: "Three blue \'z\'s.", usage: "tired, sleepiness"),
    Emoji(symbol: "🏁", name: "Checkered Flag", detailDescription: "A black and white checkered flag.", usage: "completion")
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    navigationItem.leftBarButtonItem = editButtonItem
  }
  
  override func setEditing(_ editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    tableView.isEditing = editing
  }
  
  // MARK: - table view data source (data)
  
  func numberOfSections(in tableView: UITableView) -> Int {
//    return 2
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    if section == 0 {
//      return students.count
//    }
    return emojis.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    if indexPath.section == 0 {
//      let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
//      let student = students[indexPath.row]
//      cell.textLabel?.text = "\(student)"
//      cell.detailTextLabel?.text = "Software Developer"
//      return cell
//    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
      let emoji = emojis[indexPath.row]
      cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
      cell.detailTextLabel?.text = "\(emoji.detailDescription)"
      return cell
//    }
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//    return section == 0 ? "Employees" : "Emoji Dictionary"
    return "Emoji Dictionary"
  }
  
  // MARK: - table view delegate (behavior)
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    if indexPath.section == 0 {
//       print("\(students[indexPath.row])")
//    } else {
       print("\(emojis[indexPath.row].symbol)")
//    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    return indexPath.section == 0 ? 44.0 : 80
    return 60
  }
  
  func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    let emojiToMove = emojis.remove(at: sourceIndexPath.row)
    emojis.insert(emojiToMove, at: destinationIndexPath.row)
    tableView.reloadData()
  }
  
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return .none
  }
}

