//
//  Game.swift
//  Apple Pie
//
//  Created by Martin Kuchar on 2020-04-24.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemainingPlayer1: Int
    var incorrectMovesRemainingPlayer2: Int
    var guessedLetters: [Character]
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    mutating func player1Guessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemainingPlayer1 -= 1
        }
    }
    
    mutating func player2Guessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemainingPlayer2 -= 1
        }
    }
}
