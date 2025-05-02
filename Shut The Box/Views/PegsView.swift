//
//  PegsView.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/28/25.
//

import SwiftUI

struct PegsView: View {
//    @State private var scaledElementIndex: Int?
    var stateManager: GameStateManager
    let scaleAmount = 1.5

    var body: some View {
        HStack {
            ForEach(stateManager.availableNumbers, id: \.self) { number in
//                createUnmatchedPegView(number: number)
                if let peg = ((stateManager.pegMatches?.first(where: { $0.number == number }))) {
                    createMatchedPegView(peg: peg)
                } else {
                    createUnmatchedPegView(number: number)
                }
            }
        }
    }
    
    func createMatchedPegView(peg: Peg) -> some View {
        PegView(
            peg: peg,
//            scale: scaledElementIndex == peg.number ? scaleAmount : 1.0,
            scale: 1.0,
            isLeadingEnd: stateManager.availableNumbers[0] == peg.number,
            isTrailingEnd:
                stateManager.availableNumbers[stateManager.availableNumbers.count - 1] == peg.number
            )
        .frame(height: 85)
//        .onLongPressGesture(minimumDuration: 0.0) {
//            scaledElementIndex = peg.number
//        } onPressingChanged: { inProgress in
//            scaledElementIndex = inProgress ? scaledElementIndex : nil
//        }
    }
    
    func createUnmatchedPegView(number: Int) -> some View {
        PegView(
            peg: .init(number),
            scale: 1.0,
            isLeadingEnd: stateManager.availableNumbers[0] == number,
            isTrailingEnd:
                stateManager.availableNumbers[stateManager.availableNumbers.count - 1] == number
        )
        .frame(height: 85)
    }
}

#Preview {
    @Previewable @Bindable var stateManager = GameStateManager()
    PegsView(stateManager: stateManager)
}
