//
//  ThemeGenerator.swift

import Foundation
import UIKit

class ThemeGenerator {
    
    init() {
        self.generateRandomTheme()
    }
    
    var globalViewBGColor: UIColor = UIColor.init()
    var globalCardFaceDownColor: UIColor = UIColor.init()
    var globalCardFaceUpColor : UIColor = UIColor.init()
    
    enum Themes: CaseIterable {
        case sports
        case places
        case halloween
        case faces
        case symbols
        case flags
    }
    
    var sports = ["⚾️","🏈", "🏓", "🥊", "🏏", "🥋", "🥏", "⚽️", "🎾", "🏸"]
    var places = ["🗽", "💒", "🏛" , "🏠", "🏡", "🕌", "🕍", "🕋", "🏰", "⛩"]
    var halloween = ["🎃ؔؔؔ", "👺", "👹", "👿", "😈", "👻", "💀", "☠️", "🤡", "😡"]
    var faces = ["😀","😁","😅","😂","😇","😛","🤪","😎","😤","🥶"]
    var symbols = ["💟","☮️","✝️","☪️","🕉","🔯","☯️","📳","📴","🅰️"]
    var flags = ["🏁", "🏳️‍🌈", "🇦🇺", "🇧🇩", "🇨🇮", "🇨🇦", "🇫🇮", "🇭🇺", "🇮🇳","🇵🇷", "🇬🇧","🇺🇸"]
    
    var setEmojis = [String]()
    
    func generateRandomTheme() {
        
//        let generatedTheme = Int(arc4random_uniform(UInt32(Themes.allCases.count))
        
        let generatedTheme : Themes = Themes.allCases.randomElement()!
        
        switch generatedTheme {
        case Themes.sports:
            globalViewBGColor = UIColor.blue
            globalCardFaceUpColor = UIColor.yellow
            globalCardFaceDownColor = UIColor.black
            setEmojis = self.sports
            break
        case Themes.places:
            globalViewBGColor = UIColor.brown
            globalCardFaceUpColor = UIColor.magenta
            globalCardFaceDownColor = UIColor.orange
            setEmojis = self.places
            break
        case Themes.halloween:
            globalViewBGColor = UIColor.black
            globalCardFaceUpColor = UIColor.brown
            globalCardFaceDownColor = UIColor.orange
            setEmojis = self.halloween
            break
        case Themes.faces:
            globalViewBGColor = UIColor.red
            globalCardFaceUpColor = UIColor.white
            globalCardFaceDownColor = UIColor.yellow
            setEmojis = self.faces
            break
        case Themes.symbols:
            globalViewBGColor = UIColor.purple
            globalCardFaceUpColor = UIColor.lightGray
            globalCardFaceDownColor = UIColor.magenta
            setEmojis = self.symbols
            break
        case Themes.flags:
            globalViewBGColor = UIColor.orange
            globalCardFaceUpColor = UIColor.white
            globalCardFaceDownColor = UIColor.green
            setEmojis = self.flags
            break
        }
    }
    
    public func getBGColor () -> UIColor {
        return self.globalViewBGColor
    }
    
    public func getFaceUpColor () -> UIColor {
        return self.globalCardFaceUpColor
    }
    
    public func getFaceDownColor () -> UIColor {
        return self.globalCardFaceDownColor

    }
    
    public func getEmojis () -> [String] {
        return self.setEmojis
    }
    
}
