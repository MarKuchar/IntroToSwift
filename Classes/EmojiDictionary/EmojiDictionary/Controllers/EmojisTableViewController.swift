//
//  EmojisTableViewController.swift
//  EmojiDictionary
//
//  Created by Derrick Park on 5/12/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit


class EmojisTableViewController: UITableViewController, AddEmojiTableViewControllerDelegate {
  
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
    
    navigationItem.title = "Emoji Dictionary"
    navigationItem.leftBarButtonItem = editButtonItem
    tableView.rowHeight = UITableView.automaticDimension // Automatic Row height
    
    // This will tell the table view a sensible estimation for how tall the average cell will be
    // (improves performace) - helping the table view
    tableView.estimatedRowHeight = 60.0
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let identifier = segue.identifier, identifier == "AddEmoji" {
      let destVC = (segue.destination as! UINavigationController).topViewController as! AddEmojiTableViewController
      destVC.delegate = self
    }
  }
  
  func add(emoji: Emoji) {
    // update model
    emojis.append(emoji)
    // update view (table view)
    tableView.insertRows(at: [IndexPath(row: emojis.count - 1, section: 0)], with: .automatic)
//    tableView.deleteRows(at: [], with: .automatic)
//    tableView.reloadRows(at: [], with: .automatic)
//    tableView.reloadData() // reload the enitre table view (hammer)
  }
  
  // MARK: - table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return emojis.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
    let emoji = emojis[indexPath.row]
    cell.emojiSymbolLabel.text = emoji.symbol
    cell.emojiNameLabel.text = emoji.name
    cell.emojiDescriptionLabel.text = emoji.detailDescription
    return cell
  }
  
//  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//    return "Emoji Dictionary"
//  }

  // MARK: - table view delegate (behavior)
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.cellForRow(at: indexPath)?.accessoryType = .none
    print("\(emojis[indexPath.row].symbol)")
  }

  override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    let emojiToMove = emojis.remove(at: sourceIndexPath.row)
    emojis.insert(emojiToMove, at: destinationIndexPath.row)
    tableView.reloadData()
  }
  
  override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return .delete
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      emojis.remove(at: indexPath.row) // update model
      tableView.deleteRows(at: [indexPath], with: .automatic) // update table view
    }
  }
  
}
