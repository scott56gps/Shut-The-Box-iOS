//
//  PegsView.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/28/25.
//

import SwiftUI

struct PegsView: View {
    @State private var touchedPegNumber: Int?
    @State private var matchedPegNumber: Int?
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
            scale: touchedPegNumber == peg.number || matchedPegNumber == peg.number ? scaleAmount : 1.0,
            isLeadingEnd: stateManager.availableNumbers[0] == peg.number,
            isTrailingEnd:
                stateManager.availableNumbers[stateManager.availableNumbers.count - 1] == peg.number
            )
        .frame(height: 85)
        .onLongPressGesture(minimumDuration: 0.0) {
            touchedPegNumber = peg.number
            // Try to locate a match
            if let total = stateManager.roll?.total {
                let matchDifference = total - peg.number
                if let matchedPeg = stateManager.pegMatches?.first(where: { matchDifference == $0.number}) {
                    matchedPegNumber = matchedPeg.number
                }
            }
        } onPressingChanged: { inProgress in
            if let roll = stateManager.roll, let touchedNumber = touchedPegNumber {
                guard !inProgress else { return }
                stateManager.removeMatch((touchedNumber, matchedPegNumber ?? roll.total - touchedNumber))
            }
            
            self.touchedPegNumber = inProgress ? touchedPegNumber : nil
            self.matchedPegNumber = inProgress ? matchedPegNumber : nil
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
    @Previewable var stateManager = GameStateManager()
    PegsView(stateManager: stateManager)
}
