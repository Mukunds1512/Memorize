//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Mukund Sharma on 6/23/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    static var themes: Array<Theme> = [
        Theme(name: "Vehicles",
              emojis: ["🚘", "🚕", "🚓", "🚑", "🏍", "🚅", "✈️", "🚀", "🚁", "⛴", "🎢", "🚢", "⛵️", "🚤", "🚃", "🚊", "🛩"],
              numberOfPairsOfCards: 5,
              color: "red"
             ),
        Theme(name: "Animals", emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🦁","🐸","🐵","🐨","🐢","🐳","🦍"],
              numberOfPairsOfCards: 8,
              color: "blue"
             ),
        Theme(name: "Plants",
              emojis: ["🌵","🎄","🌴","🪴","🍃","🍁","🎍","🌾","🍀","🌳"],
              numberOfPairsOfCards: 7,
              color: "green"
             ),
        Theme(name: "Faces",
              emojis: ["😄","😇","😌","🤪","🧐","🥸","🥳"],
              numberOfPairsOfCards: 8,
              color: "yellow"
             ),
        Theme(name: "Sports",
              emojis: ["⚽️","🏀","🏈","⚾️","🏓","🪃"],
              numberOfPairsOfCards: 4,
             color: "orange"
             ),
        Theme(name: "Hearts",
              emojis: ["❤️","🧡","💛","💙","💜","🖤","🤍","💘", "🤎"],
              numberOfPairsOfCards: 6,
              color: "pink"
             )
    ]
    
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String>
        
    private var theme: Theme
    
    var themeColor: Color {
        switch theme.color {
        case "red":
            return .red
        case "green":
            return .green
        case "blue":
            return .blue
        case "orange":
            return .orange
        case "yellow":
            return .yellow
        case "pink":
            return .pink
        default:
            return .black
        }
    }
    
    var score: Int {
        return model.score
    }
    
    var themeName: String {
        return theme.name
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
     
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
