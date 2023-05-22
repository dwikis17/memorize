//
//  ContentView.swift
//  Memorize
//
//  Created by Dwiki Dwiki on 03/05/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game : EmojiMemoryGame
    typealias Card = MemoryGame<String>.Card
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3 ){ card in
                if card.isMatched && !card.isFaceUp {
                    Rectangle().opacity(0)
                } else {
                    CardView(card: card)
                        .padding(5)
                        .onTapGesture {
                            game.chooseCard(card)
                        }
                }
            }
            .foregroundColor(.red)
            .font(.title)
            .padding(.horizontal)

    }
    
    @ViewBuilder
    private func cardView(for card: Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        } else {
            CardView(card: card)
                .padding(5)
                .onTapGesture {
                    game.chooseCard(card)
                }
        }
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstant.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstant.lineWidth)
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 20)).opacity(0.5).padding(4)
                    Text(card.cardContent).font(font(in: geometry.size))

                } else if card.isMatched{
                    shape.opacity(0)
                }
                else {
                        shape.fill()
                    }
                }
        })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstant.fontScale )
    }
    
    private struct DrawingConstant {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale :CGFloat = 0.65
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.chooseCard(game.cards.first!)
         return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}


