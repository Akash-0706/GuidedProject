//
//  ViewController.swift
//  ApplePie
//
//  Created by Student on 26/02/24.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["buccaneer", "swift" , "glorious", "incandescent", "bug", "program" ]
//    let cast = ["Vivien", "Marlon", "Kim", "karl"]
//    let list = cast.joined(separator: ", ")
//    print(list)
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0
    var totalLosses = 0
    var currentGame : Game!
    

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var lettersButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }
    
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLettersButtons(true)
            updateUI()
        }
        else{
            enableLettersButtons(false)
        }
    }
    func enableLettersButtons(_ enable: Bool){
        for button in lettersButton{
            button.isEnabled =  enable
        }
    }
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
     correctWordLable.text = currentGame.formattedWord
        scoreLabel.text = "Wins: \(totalWins) , Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0{
            totalLosses += 1
        }
        else if currentGame.word == currentGame.formattedWord{
            totalWins += 1
        }
        else{
            updateUI()
        }
        
        var totalWins = 0{
            didSet{
                newRound()
            }
        }
        var totalLosses = 0{
            didSet{
                newRound()
            }
        }
    }
}

