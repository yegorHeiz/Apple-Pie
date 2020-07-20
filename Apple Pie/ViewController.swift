//
//  ViewController.swift
//  Apple Pie
//
//  Created by Yegor Heiz on 16.07.2020.
//  Copyright © 2020 Yegor Heiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords = [
        "banana", "apple",
        "macbook", "iphone",
        "cherry", "window",
        "bed",
    ]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            enableButtons()
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            enableButtons()
            newRound()
        }
    }
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGussed(letter: letter)
        updateUI()
    }
    
    func newRound(){
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
    }
    
    func updateUI(){
        scoreLabel.text = "Wins: \(totalWins), Loses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        var letters: [String] = []
        for char in currentGame.formattedWord {
            letters.append(String(char))
        }
        correctWordLabel.text = letters.joined(separator: " ")
        
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        }
        
        if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        }
        
        if listOfWords.isEmpty {
            disableButtons()
        }
    }
    
    func enableButtons(){
        for btn in letterButtons {
            btn.isEnabled = true
        }
    }
    
    func disableButtons(){
        for btn in letterButtons {
            btn.isEnabled = false
        }
    }
}

