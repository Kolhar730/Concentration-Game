//
//  ViewController.swift
//  Concentration
//
//  Created by smallcase_kolhar730 on 28/06/19.
//  Copyright © 2019 smallcase_kolhar730. All rights reserved.
// TODO: add Date and scoring - extra credit

import UIKit

class ViewController: UIViewController {
    
    var flipCount : Int = 0
    
    @IBOutlet var concentrationCards: Array<UIButton>!
    
    @IBOutlet weak var flipCounterLabel: UILabel!
    @IBOutlet weak var scoreDisplay: UILabel!
    
    var emojis = ["😂", "😀", "😂","😀"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        self.flipCount += 1;
        
        if let cardNumber = concentrationCards.firstIndex(of: sender) {
            NSLog("Card Number: \(cardNumber)")
            self.flipCard(withEmoji: emojis[cardNumber], on: sender)
        }
        else {
            NSLog("Card not found!")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if (button.currentTitle == emoji) {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = .orange
            flipCounterLabel.text = "Flips: " + String(flipCount)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = .brown
            flipCounterLabel.text = "Flips: " + String(flipCount)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
