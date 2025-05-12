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
    let stateManager: GameStateManager
    let initialScale = 1.0
    let scaleAmount = 1.5
    let initialZIndex = 0.0
    let scaledZIndex = 1.0

    var body: some View {
        HStack(spacing: 0) {
            ForEach(stateManager.availableNumbers, id: \.self) { number in
                if let peg = ((stateManager.pegMatches?.first(where: { $0.number == number }))) {
                    createMatchedPegView(peg: peg)
                } else {
                    createUnmatchedPegView(number: number)
                }
            }
            .scaledToFill()
            .frame(height: 100, alignment: .center)
        }
        .scaledToFill()
    }

    func createMatchedPegView(peg: Peg) -> some View {
        let isScaled = touchedPegNumber == peg.number || matchedPegNumber == peg.number
        return PegView(
            peg: peg,
            scale: isScaled ? scaleAmount : initialScale,
            zIndex: isScaled ? scaledZIndex : initialZIndex,
            isLeadingEnd: stateManager.availableNumbers[0] == peg.number,
            isTrailingEnd:
                stateManager.availableNumbers[stateManager.availableNumbers.count - 1] == peg.number
            )
        .frame(width: 85, height: 95)
        .scaledToFill()
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
            scale: initialScale,
            zIndex: initialZIndex,
            isLeadingEnd: stateManager.availableNumbers[0] == number,
            isTrailingEnd:
                stateManager.availableNumbers[stateManager.availableNumbers.count - 1] == number
        )
        .frame(width: 85, height: 95)
        .scaledToFill()
    }
}

#Preview {
//    @Previewable var stateManager = GameStateManager(numbers: [1,2,3,4])
    @Previewable var stateManager = GameStateManager()
    PegsView(stateManager: stateManager)
}
