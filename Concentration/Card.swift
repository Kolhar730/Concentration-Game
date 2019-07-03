//
//  Card.swift

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    var dateMatched: Date = Date()
    
    static var indentifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        self.indentifierFactory += 1
        return self.indentifierFactory
    }
    
    init () {
        self.identifier = Card.getUniqueIdentifier()
    }
}
