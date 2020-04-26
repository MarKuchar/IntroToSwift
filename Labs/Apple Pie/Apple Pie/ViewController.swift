//
//  ViewController.swift
//  Apple Pie
//
//  Created by Martin Kuchar on 2020-04-24.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords: [String] = ["hamburger", "apple", "january", "squash",
    "tiger", "jaguar", "hockey"]
    let incorrectMovesAllowed = 5
    var guessCoutner = 0
    var totalWinsP1 = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var totalWinsP2 = 0 {
        didSet {
            newRound()
        }
    }
    
    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var correctWordLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var scoreLabel2: UILabel!
    @IBOutlet var Looses: UILabel!
    
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
        currentGame = Game(word: newWord, incorrectMovesRemainingPlayer1: incorrectMovesAllowed, incorrectMovesRemainingPlayer2: incorrectMovesAllowed,
            guessedLetters: [])
        enableLetterButtons(true)
            guessCoutner = 0
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
        scoreLabel.text = "Player 1 wins: \(totalWinsP1)"
        scoreLabel2.text = "Player 2 wins: \(totalWinsP2)"
        Looses.text = "Total looses: \(totalLosses)"
        if guessCoutner % 2 == 0 {
            treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemainingPlayer1)")
            scoreLabel.backgroundColor = .green
            scoreLabel2.backgroundColor = .white
        } else {
            treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemainingPlayer2)")
            scoreLabel2.backgroundColor = .green
            scoreLabel.backgroundColor = .white
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        if guessCoutner % 2 == 0 {
            currentGame.player1Guessed(letter: letter)
        } else {
            currentGame.player2Guessed(letter: letter)
        }
        guessCoutner += 1
        updateGameState()
    }
    
    func updateGameState() {
        if currentGame.word == currentGame.formattedWord {
            if guessCoutner % 2 == 1 {
                totalWinsP1 += 1
            } else {
                totalWinsP2 += 1
            }
        } else if currentGame.incorrectMovesRemainingPlayer1 == 0 {
            totalWinsP2 += 1
        } else if currentGame.incorrectMovesRemainingPlayer2 == 0 {
            totalWinsP1 += 1
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

