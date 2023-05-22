//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Dwiki Dwiki on 03/05/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let viewModel = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: viewModel)
        }
    }
}
