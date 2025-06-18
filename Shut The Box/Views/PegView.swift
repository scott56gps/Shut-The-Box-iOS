//
//  Peg.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/24/25.
//
import SwiftUI

struct PegView: View {
    var peg: Peg
    let scale: Double
    let zIndex: Double
    let isLeadingEnd: Bool
    let isTrailingEnd: Bool
    
    var body: some View {
        Text(String(peg.number))
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
                    .fill(peg.color)
            )
            .scaleEffect(scale)
            .zIndex(zIndex)
    }
}

#Preview {
    PegView(peg: Peg(1, color: .blue), scale: 1.0, zIndex: 0.0, isLeadingEnd: true, isTrailingEnd: false)
}
