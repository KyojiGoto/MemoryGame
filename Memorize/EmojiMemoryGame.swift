//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kyoji Goto on 2020-05-24.
//  Copyright © 2020 Kyoji Goto. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    
    init() {
        self.theme = EmojiMemoryGame.createTheme()
        self.model = EmojiMemoryGame.createMemoryGame(theme: self.theme)
    }
    
    static func createTheme() -> Theme {
        var themes = Array<Theme>()
        themes.append(Theme(name: "Halloween", emojis: ["👻", "🎃", "🕷", "🦇", "🍬", "🧟‍♂️"], numberOfPairs: Int.random(in: (1...3)) * 2, color: Color.orange))
        themes.append(Theme(name: "Monuments", emojis: ["🗽", "🗿", "🗼", "🏰"], numberOfPairs: 4, color: Color.purple))
        themes.append(Theme(name: "Vehicles", emojis: ["🚘", "🚖", "🚔", "🛩", "🚆", "🛸"], numberOfPairs: 6, color: Color.red))
        themes.append(Theme(name: "People", emojis: ["🎅", "👩‍🏫", "🕵️", "👨‍🚒", "👩‍✈️", "🧑‍🚀"], numberOfPairs: 6, color: Color.pink))
        themes.append(Theme(name: "Smiley", emojis: ["😄", "🤓", "😉", "🥺", "🤯", "🤪"], numberOfPairs: 6, color: Color.yellow))
        themes.append(Theme(name: "Animals", emojis: ["🐶", "🦁", "🦄", "🐮", "🐻", "🐱", "🐣", "🐳", "🦖", "🦒", "🦉", "🦧"], numberOfPairs: 12, color: Color.green))
        return themes[Int.random(in: themes.indices)]
    }
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Access to score
    
    var score: Int {
        model.score
    }
    
    // MARK: - Access to theme name and color
    
    var color: Color {
        theme.color
    }
    
    var name: String {
        theme.name
    }
    
    // MARK: - Intent(s)
    
    func chooseCard(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func newGame() {
        self.theme = EmojiMemoryGame.createTheme()
        self.model = EmojiMemoryGame.createMemoryGame(theme: self.theme)
    }
    
    struct Theme {
        var name: String
        var emojis: Array<String>
        var numberOfPairs: Int
        var color: Color
    }
}
