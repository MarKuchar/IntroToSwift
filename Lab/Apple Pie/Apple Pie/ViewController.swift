//
//  ViewController.swift
//  Apple Pie
//
//  Created by Martin Kuchar on 2020-04-24.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords: [String] = ["hamburger", "pizza", "mark", "squash",
    "tiger", "jaguar", "hockey"]
    let incorrectMovesAllowed = 7
    var totalWins = 0
    var totalLosses = 0
    
    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var correctWordLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!

    @IBOutlet var letterButtons: [UIButton]!
    
    var currentGame: Game!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func newRound() {
        let newWord = listOfWords.remove(at: 0)
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
     }
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
}

