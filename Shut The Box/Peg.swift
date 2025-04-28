//
//  Peg.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/24/25.
//
import SwiftUI

struct Peg: View {
    let number: String
    let scale: Double
    let isLeadingEnd: Bool
    let isTrailingEnd: Bool
    
    var body: some View {
        Text(number)
            .font(.largeTitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                UnevenRoundedRectangle(
                    topLeadingRadius: isLeadingEnd ? 20 : 0,
                        bottomLeadingRadius: isLeadingEnd ? 20 : 0,
                        bottomTrailingRadius: isTrailingEnd ? 20 : 0,
                        topTrailingRadius: isTrailingEnd ? 20 : 0
                )
                    .stroke(Color.black, lineWidth: 2)
                    .fill(Color.blue)
                    .aspectRatio(1.0, contentMode: .fill)
            )
            .scaleEffect(scale)
    }
}

#Preview {
    Peg(number: "1", scale: 1.0, isLeadingEnd: true, isTrailingEnd: false)
}
