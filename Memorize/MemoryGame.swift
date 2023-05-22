//
//  MemoryGame.swift
//  Memorize
//
//  Created by Dwiki Dwiki on 07/05/23.
//

import Foundation


// Model
struct MemoryGame<CardContentType> where CardContentType: Equatable {
    private(set) var cards : Array<Card>
    
    private var indexOfFirstFacedUpCard : Int? {
        get { cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly }
        set{ cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue)}}
//        set {
//            for index in cards.indices {
//                if index != newValue{
//                    cards[index].isFaceUp = false
//                } else {
//                    cards[index].isFaceUp = true
//                }
//            }
//        }
    }
    
    mutating func chooseCard(_ card: Card) {
        if let choosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[choosenIndex].isMatched,
           !cards[choosenIndex].isFaceUp
        {
            
            if let potentialMatchIndex = indexOfFirstFacedUpCard {
                if cards[potentialMatchIndex].cardContent == cards[choosenIndex].cardContent {
                    cards[potentialMatchIndex].isMatched = true
                    cards[choosenIndex].isMatched = true
                }
                cards[choosenIndex].isFaceUp = true
            } else {
                indexOfFirstFacedUpCard = choosenIndex
            }

        }
    }
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContentType) {
        cards = []
        for index in 0..<numberOfPairOfCards {
            let content = createCardContent(index)
            cards.append(Card(id: index*2, cardContent: content))
            cards.append(Card(id: index*2+1, cardContent: content))
        }
        cards.shuffle()
    }
    
     // this struct is actually called MemoryGame.Card
    struct Card: Identifiable {
        var id: Int
        var isFaceUp = false
        var isMatched = false
        var cardContent: CardContentType
    }
    
}


extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
