//
//  ContentView.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var scaledElementIndex: Int?
    let numbers = [1,2,3,4,5,6,7,8,9]
    let scaleAmount = 1.5
    
    var body: some View {
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
    }
}

#Preview {
    ContentView()
}
