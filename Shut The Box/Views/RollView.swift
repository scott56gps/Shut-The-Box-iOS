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
        if let roll = (stateManager.roll) {
            HStack {
                constructDie(pips: roll.firstDie)
                constructDie(pips: roll.secondDie)
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
        }
        else {
            Button(action: {
                stateManager.rollDice()
            }) {
                Text("Roll!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.black)
                    .padding([.top, .bottom], 12)
                    .frame(maxWidth: .infinity, maxHeight: 60)
            }
            .background(.blue, in: RoundedRectangle(cornerRadius: 12))
        }
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
