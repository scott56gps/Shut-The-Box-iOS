//
//  RollView.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/28/25.
//

import SwiftUI

struct RollView: View {
    var stateManager: GameStateManager
    
    var body: some View {
        HStack {
            if let roll = (stateManager.roll) {
                constructDie(pips: roll.firstDie)
                constructDie(pips: roll.secondDie)
            } else {
                Button(action: {
                    stateManager.rollDice()
                }) {
                    Text("Roll!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.black)
                        .padding(12)
                        .buttonStyle(.borderedProminent)
                }
            }
        }
        .frame(width: 130, height: 80)
    }
    
    func constructDie(pips: Int) -> some View {
        Image(systemName: "die.face.\(pips)")
            .resizable()
            .scaledToFit()
            .foregroundStyle(LinearGradient(
                stops: [.init(color: .random(), location: 0),
                        .init(color: .random(), location: 0.25),
                        .init(color: .random(), location: 0.75)],
                startPoint: .leading, endPoint: .trailing))
            .background(Color.black, in: RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    @Previewable @Bindable var stateManager = GameStateManager(
        roll: Roll((3, 4))
    )
    RollView(stateManager: stateManager)
}

#Preview {
    @Previewable @Bindable var stateManager = GameStateManager()
    RollView(stateManager: stateManager)
}
