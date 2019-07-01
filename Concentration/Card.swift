//
//  Card.swift
//  Concentration
//
//  Created by smallcase_kolhar730 on 30/06/19.
//  Copyright © 2019 smallcase_kolhar730. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var indentifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        self.indentifierFactory += 1
        return self.indentifierFactory
    }
    
    init () {
        self.identifier = Card.getUniqueIdentifier()
    }
}
