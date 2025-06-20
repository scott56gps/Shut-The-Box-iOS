//
//  ContentView.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/24/25.
//

import SwiftUI

struct GameView: View {
    @State private var stateManager = GameStateManager()
    
    var body: some View {
        if stateManager.isGameOverAndBoxShut.0 {
            GameOverView(stateManager: stateManager)
        } else {
            VStack {
                Spacer()
                ScoreView(stateManager: stateManager)
                PegsView(stateManager: stateManager)
                Spacer()
                RollView(stateManager: stateManager)
            }
            .background(Color(red: 0.64, green: 0.64, blue: 1))
        }
    }
}

#Preview {
    GameView()
}
