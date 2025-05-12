//
//  ScoreView.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 5/12/25.
//

import SwiftUI

struct ScoreView: View {
    let stateManager: GameStateManager
    
    var body: some View {
        Text("Score: \(stateManager.availableNumbers.reduce(0, +))")
            .foregroundStyle(Color.white)
            .font(.title2)
            .fontWeight(.bold)
            .padding(12)
            .background(.black, in: RoundedRectangle(cornerRadius: 12))

    }
}

#Preview {
    @Previewable var stateManager = GameStateManager()
    ScoreView(stateManager: stateManager)
}
