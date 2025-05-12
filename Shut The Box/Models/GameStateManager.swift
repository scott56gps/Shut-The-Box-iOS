//
//  GameStateManager.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/28/25.
//
import SwiftUI
import Observation

@Observable
class GameStateManager {
    var availableNumbers: [Int] = Array(1...9)
    var roll: Roll?
    var pegMatches: Set<Peg>?
    var isGameOverAndBoxShut: (Bool, Bool) = (false, false)
    let masterColors = [Color.red, Color.blue, Color.green, Color.yellow, Color.orange, Color.purple, Color.pink, Color.mint, Color.indigo, Color.teal]
    
    init(numbers: [Int]) {
        self.availableNumbers = numbers
    }
    init(roll: Roll? = nil) {
        self.roll = roll
    }
    init(numbers: [Int], roll: Roll? = nil) {
        self.availableNumbers = numbers
        self.roll = roll
    }
    
    func rollDice() {
        let roll = self.roll ?? Roll(
            (Int.random(in: 1...6), Int.random(in: 1...6))
        )

        let availablePairs = getAvailablePairs(sum: roll.total)
        // Set Game Over if there are no available moves left
        if availablePairs.isEmpty {
            isGameOverAndBoxShut = (true, false)
            return
        }
        
        let colors = masterColors.shuffled()[0...availablePairs.count-1]
        
        // Convert the availablePairs to peg matches
        self.pegMatches = zip(availablePairs, colors).reduce(into: Set([])) { acc, matchAndColorPair in
            if matchAndColorPair.0.0 == 0 {
                acc.insert(Peg(matchAndColorPair.0.1, color: matchAndColorPair.1))
            } else {
                acc.insert(Peg(matchAndColorPair.0.0, color: matchAndColorPair.1))
                acc.insert(Peg(matchAndColorPair.0.1, color: matchAndColorPair.1))
            }
        }
        self.roll = roll
    }
    
    /**
     Removes the given peg and its corresponding match, if any, from the state's availablePegs.
     SIDE EFFECT:
     Modifies availablePegs to not contain the given peg and its match that together add to the current roll total.
     */
    func removeMatch(_ matchedPegNumbers: (Int, Int)) {
        self.availableNumbers
            .removeAll(where: { $0 == matchedPegNumbers.0 || $0 == matchedPegNumbers.1 })
        self.pegMatches = nil
        self.roll = nil
            
        // Check to see if the box was shut
        if self.availableNumbers.isEmpty {
            isGameOverAndBoxShut = (true, true)
        }
    }
        
    func reset() {
        self.availableNumbers = Array(1...9)
        self.pegMatches = nil
        self.roll = nil
        self.isGameOverAndBoxShut = (false, false)
    }
}
