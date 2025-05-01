//
//  GameStateManager.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/28/25.
//
import SwiftUI

@Observable class GameStateManager {
    var availablePegs: [Peg] = (1...9).reduce([]) { acc, number in
        acc + [Peg(number)]
    }
    var roll: Roll?
    
    init(numbers: [Int]) {
        self.availablePegs = numbers.map(Peg.init)
    }
    
    init(roll: Roll? = nil) {
        self.roll = roll
    }
    
    func rollDice() {
        let roll = self.roll ?? Roll(
            (Int.random(in: 1...6), Int.random(in: 1...6))
        )

        let availablePairs = getAvailablePairs(sum: roll.total)
        var colors = [
            Color.red,
            Color.green,
            Color.blue,
            Color.yellow,
            Color.orange,
            Color.purple
        ]

        // Convert the availablePairs to pegs
        availablePairs.forEach { pair in
            let color = colors.popLast() ?? Color.blue
            if pair.0 == 0 {
                self.availablePegs[pair.1 - 1] = Peg(pair.1, color: color)
            } else {
                self.availablePegs[pair.0 - 1] = Peg(pair.0, color: color)
                self.availablePegs[pair.1 - 1] = Peg(pair.1, color: color)
            }
        }
        
        self.roll = roll
    }
        
    func reset() {
        self.availablePegs = (1...9).reduce([]) { acc, number in
            acc + [Peg(number)]
        }
        self.roll = nil
    }
}
