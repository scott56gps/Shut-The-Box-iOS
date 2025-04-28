//
//  PegsView.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/28/25.
//

import SwiftUI

struct PegsView: View {
    @State private var scaledElementIndex: Int?
    @Binding var stateManager: GameStateManager
    let scaleAmount = 1.5

    var body: some View {
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
    }
}

#Preview {
    @Previewable @State var stateManager = GameStateManager()
    PegsView(stateManager: $stateManager)
}
