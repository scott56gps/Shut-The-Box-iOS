//
//  PegsView.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/28/25.
//

import SwiftUI

struct PegsView: View {
    @State private var scaledElementIndex: Int?
    @Bindable var stateManager: GameStateManager
    let scaleAmount = 1.5

    var body: some View {
        HStack {
            ForEach($stateManager.availablePegs, id: \.self.number) { $peg in
                PegView(peg: $peg,
                        scale: scaledElementIndex != nil &&
                        scaledElementIndex! == peg.number ? scaleAmount : 1.0,
                        isLeadingEnd: peg.number == stateManager.availablePegs[0].number,
                        isTrailingEnd: stateManager.availablePegs.last?.number == peg.number,
                )
                .frame(height: 85)
                .onLongPressGesture(minimumDuration: 0.0) {
                    scaledElementIndex = peg.number
                } onPressingChanged: { inProgress in
                    scaledElementIndex = inProgress ? scaledElementIndex : nil
                    
                    if(!inProgress) {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @Bindable var stateManager = GameStateManager()
    PegsView(stateManager: stateManager)
}
