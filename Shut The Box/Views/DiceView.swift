//
//  DiceView.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 5/9/25.
//

import SwiftUI

struct DiceView: View {
    // Marking a variable with @State means that this object OWNS
    //  this piece of data.  This object is the Source of Truth
    @State private var pips1: Int = 3
    @State private var pips2: Int = 4
    
    var body: some View {
        VStack {
            HStack {
                constructDie(pips: pips1)
                constructDie(pips: pips2)
            }
            Button("Roll!") {
                withAnimation {
                    pips1 = Int.random(in: 1...6)
                    pips2 = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    func constructDie(pips: Int) -> some View {
        Image(systemName: "die.face.\(pips)")
            .resizable()
            .frame(width: 100, height: 100)
    }
}

#Preview {
    DiceView()
}
