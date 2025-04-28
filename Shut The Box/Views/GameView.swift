//
//  ContentView.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/24/25.
//

import SwiftUI

struct GameView: View {
    @State private var scaledElementIndex: Int?
    @State private var stateManager = GameStateManager()
    let scaleAmount = 1.5
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(stateManager.numbers, id: \.self) { number in
                    PegView(number: String(number),
                        scale: scaledElementIndex != nil &&
                        scaledElementIndex! == number ? scaleAmount : 1.0,
                        isLeadingEnd: number == stateManager.numbers[0],
                        isTrailingEnd: stateManager.numbers.last == number,
                    )
                    .frame(height: 85)
                    .onLongPressGesture(minimumDuration: 0.0) {
                        scaledElementIndex = number
                    } onPressingChanged: { inProgress in
                        scaledElementIndex = inProgress ? scaledElementIndex : nil
                    }
                }
            }
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
