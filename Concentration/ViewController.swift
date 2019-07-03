//
//  ViewController.swift

import UIKit

class ViewController: UIViewController {
    
    lazy var game : Concentration = Concentration(numberOfPairsOfCards: ((concentrationCards.count + 1) / 2) )
    
    var flipCount = 0 {
        didSet {
            flipCounterLabel.text = String(flipCount)
        }
    }
    
    lazy var emojiChoices : [String] = self.game.theme.getEmojis()
    
    @IBOutlet weak var themeLabel: UILabel!
    
    @IBOutlet var concentrationCards: [UIButton]!
    
    func startNewGame () {
        game = Concentration(numberOfPairsOfCards: (self.concentrationCards.count + 1) / 2)
        
        flipCount = 0
        
        scoreDisplay.text = "\(0)"
        
        self.view.backgroundColor = game.theme.getBGColor()
        
        for button in concentrationCards {
            button.backgroundColor = game.theme.getFaceDownColor()
            button.setTitle("", for: UIControl.State.normal)
            button.isEnabled = true
        }
        
        emojiChoices = game.theme.getEmojis()
        
        themeLabel.text = "Theme: " + game.theme.getThemeText()
        
        self.view.setNeedsDisplay() // my magic wand!
    }
    
    @IBAction func generateNewGame(_ sender: UIButton) {
        self.startNewGame()
    }
    
    @IBOutlet weak var flipCounterLabel: UILabel!
    
    @IBOutlet weak var scoreDisplay: UILabel!
    
    var emojis = Dictionary<Int, String>()
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if let cardNumber = concentrationCards.firstIndex(of: sender) {
            
            game.chooseCard(at: cardNumber)
            
            self.flipCount += 1
            
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
                button.isEnabled = false
            } else {
                button.isEnabled = true
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
        self.startNewGame()
        scoreDisplay.text = "0"
        flipCounterLabel.text = "0"
    }
}
