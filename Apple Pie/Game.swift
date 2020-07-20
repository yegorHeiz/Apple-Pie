//
//  Game.swift
//  Apple Pie
//
//  Created by Yegor Heiz on 16.07.2020.
//  Copyright © 2020 Yegor Heiz. All rights reserved.
//

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var formattedWord: String {
        get {
            var result = ""
            
            for char in word {
                if guessedLetters.contains(char) {
                    result += String(char)
                } else {
                    result += "_"
                }
            }
            
            return result
        }
    }
    
    mutating func playerGussed(letter: Character){
        guessedLetters.append(letter)
        
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
