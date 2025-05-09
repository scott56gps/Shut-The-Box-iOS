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
            Spacer()
            Text(stateManager.isGameOverAndBoxShut.1 ? "You Shut The Box!" :
                    "Game Over!")
            .font(.title)
            Text("Score: \(stateManager.availableNumbers.reduce(0, +))")
                .font(.title)
            Spacer()
            Button(action: {
                stateManager.reset()
            }) {
                Text("Play Again")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.black)
                    .padding(12)
                    .background(
                        Color.blue,
                        in: RoundedRectangle(cornerRadius: 12)
                    )
            }
        }
    }
}

#Preview {
    @Previewable var stateManager = GameStateManager()
    GameOverView(stateManager: stateManager)
}
