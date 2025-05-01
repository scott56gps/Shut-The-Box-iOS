//
//  RollView.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/28/25.
//

import SwiftUI

struct RollView: View {
    @Bindable var stateManager: GameStateManager
    
    var body: some View {
        HStack {
            if let roll = (stateManager.roll) {
                constructTextView(withText: "Die 1: \(roll.firstDie)")
                constructTextView(withText: "Die 2: \(roll.secondDie)")
            } else {
                Button(action: {
                    stateManager.rollDice()
                }) {
                    constructTextView(withText: "Roll!")
                }
            }
        }
        .background(Color.blue, in: RoundedRectangle(cornerRadius: 12))
    }
    
    func constructTextView(withText text: String) -> some View {
        Text(text)
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
            .padding(12)
    }
}

#Preview {
    @Previewable @Bindable var stateManager = GameStateManager(roll: Roll((3, 4)))
    RollView(stateManager: stateManager)
}

#Preview {
    @Previewable @Bindable var stateManager = GameStateManager()
    RollView(stateManager: stateManager)
}
