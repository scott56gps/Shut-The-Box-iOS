//
//  ContentView.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var scaledElementIndex: Int?
    @State private var stateManager = GameStateManager()
    
    let numbers = [1,2,3,4,5,6,7,8,9]
    let scaleAmount = 1.5
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(numbers, id: \.self) { number in
                    Peg(number: String(number),
                        scale: scaledElementIndex != nil &&
                        scaledElementIndex! == number ? scaleAmount : 1.0,
                        isLeadingEnd: number == numbers[0],
                        isTrailingEnd: numbers.last == number,
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
                if let roll = (stateManager.roll) {
                    Text("Die 1: \(roll.firstDie)")
                        .font(.title)
                    Text("Die 2: \(roll.secondDie)")
                        .font(.title)
                } else {
                    CTAButton("Roll!") {
                        stateManager.rollDice()
                    }
                }
            }
//                        .padding(.top, 16)
            Button() {
                stateManager.reset()
            } label: {
                Text("Reset")
                    .font(.title)
            }
        }
    }
}

#Preview {
    ContentView()
}
