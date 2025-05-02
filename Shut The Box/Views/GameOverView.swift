//
//  GameOverView.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 5/2/25.
//
import SwiftUI

struct GameOverView: View {
    let stateManager: GameStateManager
    
    var body: some View {
        VStack {
            Text(stateManager.isGameOverAndBoxShut.1 ? "You Shut The Box!" :
                    "Game Over!  Score: \(stateManager.availableNumbers.reduce(0, +))")
            Button("Play Again") {
                stateManager.reset()
            }
        }
    }
}
