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
        VStack {
            Spacer()
            PegsView(stateManager: $stateManager)
            Spacer()
            HStack {
                Button() {
                    stateManager.reset()
                } label: {
                    Text("Reset")
                        .font(.title)
                }
                Spacer()
                RollView(stateManager: $stateManager)
                Spacer()
            }
        }
    }
}

#Preview {
    GameView()
}
