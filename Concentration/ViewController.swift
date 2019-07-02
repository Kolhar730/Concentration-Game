//
//  ViewController.swift
//  Concentration
//
//  Created by smallcase_kolhar730 on 28/06/19.
//  Copyright © 2019 smallcase_kolhar730. All rights reserved.

// TODO: add Date and scoring - extra credit

import UIKit

class ViewController: UIViewController {
    
    lazy var initGame : Concentration = Concentration(numberOfPairsOfCards: (concentrationCards.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipCounterLabel.text = String(flipCount)
        }
    }
    
    @IBOutlet var concentrationCards: [UIButton]!
    
    @IBAction func generateNewGame(_ sender: UIButton) {
    
        initGame.clearGame()
    }
    
    @IBOutlet weak var flipCounterLabel: UILabel!
    
    @IBOutlet weak var scoreDisplay: UILabel!
    
    var emojis = Dictionary<Int, String>()
    
    @IBAction func touchCard(_ sender: UIButton) {
        self.flipCount += 1;
        
        if let cardNumber = concentrationCards.firstIndex(of: sender) {
            
            initGame.chooseCard(at: cardNumber)
            
            updateViewFromModel()
        }
        else {
            NSLog("Card not found!")
        }
    }
    
    
    
    func updateViewFromModel () {
        
        self.scoreDisplay.text = "\(initGame.scoreKeeper)"
        
        for index in concentrationCards.indices {
            let button = concentrationCards[index]
            let card = initGame.cards[index]
            
            if (card.isFaceUp) {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = .brown
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? .black : .orange
                if card.isMatched {
                    button.isEnabled = false
                }
            }
        }
    }
    
    var emojiChoices = ["😂","😀", "😁", "🧐", "🤖", "😈", "🦷", "🙈", "⚽️", "🎾"]
    
    func emoji(for card: Card) -> String {
        
        if emojis[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojis[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emojis[card.identifier] ?? "?"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreDisplay.text = "0"
        flipCounterLabel.text = "0"
    }
}
