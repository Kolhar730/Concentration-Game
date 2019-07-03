//
//  ViewController.swift

import UIKit

class ViewController: UIViewController {
    
    lazy var game : Concentration = Concentration(numberOfPairsOfCards: (self.concentrationCards.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipCounterLabel.text = String(flipCount)
        }
    }
    
    lazy var emojiChoices = game.theme.getEmojis()
    
    @IBOutlet var concentrationCards: [UIButton]!
    
    @IBAction func generateNewGame(_ sender: UIButton) {
        let tempGame = Concentration(numberOfPairsOfCards: (self.concentrationCards.count + 1) / 2)
        
        self.game = tempGame
        self.flipCount = 0
        self.scoreDisplay.text = "\(0)"
        self.view.backgroundColor = game.theme.getBGColor()
        
        for button in concentrationCards {
            button.backgroundColor = game.theme.getFaceDownColor()
        }
        
        self.view.setNeedsDisplay() // my magic wand!
    }
    
    @IBOutlet weak var flipCounterLabel: UILabel!
    
    @IBOutlet weak var scoreDisplay: UILabel!
    
    var emojis = Dictionary<Int, String>()
    
    @IBAction func touchCard(_ sender: UIButton) {
        self.flipCount += 1;
        
        if let cardNumber = concentrationCards.firstIndex(of: sender) {
            
            game.chooseCard(at: cardNumber)
            
            updateViewFromModel()
        }
        else {
            NSLog("Card not found!")
        }
    }
    
    
    
    func updateViewFromModel () {
        
        self.scoreDisplay.text = "\(game.scoreKeeper)"
        
        for index in concentrationCards.indices {
            let button = concentrationCards[index]
            let card = game.cards[index]
            
            if (card.isFaceUp) {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = game.theme.getFaceUpColor()
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? game.theme.getBGColor() : game.theme.getFaceDownColor()
                if card.isMatched {
                    button.isEnabled = false
                }
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        
        if emojis[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojis[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emojis[card.identifier]!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreDisplay.text = "0"
        flipCounterLabel.text = "0"
    }
}
