//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Mukund Sharma on 6/22/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
