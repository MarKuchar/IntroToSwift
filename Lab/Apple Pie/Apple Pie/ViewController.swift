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
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var correctWordLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!

    @IBOutlet var letterButtons: [UIButton]!
    
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
           // Do any additional setup after loading the view.
       }
    
    func newRound() {
        if !listOfWords.isEmpty {
        let newWord = listOfWords.remove(at: 0)
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        enableLetterButtons(true)
        updateUI()
        } else {
            enableLetterButtons(false)
        }
     }
    
    func updateUI() {
        var letters = [String]()
        for lettter in currentGame.formattedWord {
            letters.append(String(lettter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func updateGameState() {
        if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else {
            updateUI()
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
}

