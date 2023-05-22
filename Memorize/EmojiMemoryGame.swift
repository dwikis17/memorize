//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Dwiki Dwiki on 07/05/23.
//

import SwiftUI

// ViewModel
class EmojiMemoryGame: ObservableObject {
    //create model
    typealias Card = MemoryGame<String>.Card
    
    static private let emojis = ["🚗", "🚕", "🚙" , "🚌","🚎", "🏎️","🚓","🚑","🚒","🚐","🛻","🚚"]
    
    
    static func createMemoryGame() -> MemoryGame<String> { MemoryGame<String>(numberOfPairOfCards: 6 ){ index in
        return emojis[index]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards : Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func chooseCard(_ card: Card) {
        model.chooseCard(card)
    }
}
