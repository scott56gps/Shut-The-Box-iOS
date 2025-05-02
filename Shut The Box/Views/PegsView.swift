//
//  PegsView.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/28/25.
//

import SwiftUI

struct PegsView: View {
    @State private var touchedNumber: Int?
    @State private var matchedNumber: Int?
    var stateManager: GameStateManager
    let scaleAmount = 1.5

    var body: some View {
        HStack {
            ForEach(stateManager.availableNumbers, id: \.self) { number in
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
            scale: touchedNumber == peg.number || matchedNumber == peg.number ? scaleAmount : 1.0,
            isLeadingEnd: stateManager.availableNumbers[0] == peg.number,
            isTrailingEnd:
                stateManager.availableNumbers[stateManager.availableNumbers.count - 1] == peg.number
            )
        .frame(height: 85)
        .onLongPressGesture(minimumDuration: 0.0) {
            touchedNumber = peg.number
            // Try to locate a match
            if let total = stateManager.roll?.total {
                if let matchedPeg = stateManager.pegMatches?.first(where: { matchingPeg in abs(total - peg.number) == matchingPeg.number}) {
                    matchedNumber = matchedPeg.number
                }
            }
        } onPressingChanged: { inProgress in
            touchedNumber = inProgress ? touchedNumber : nil
            matchedNumber = inProgress ? matchedNumber : nil
        }
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
