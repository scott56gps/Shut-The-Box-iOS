//
//  GameStateManager.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/28/25.
//
import SwiftUI

@Observable class GameStateManager {
    var availableNumbers = [1,2,3,4,5,6,7,8,9]
    var roll: Roll?
    
    init(numbers: [Int]) {
        self.availableNumbers = numbers
    }
    
    init(roll: Roll? = nil) {
        self.roll = roll
    }
    
    func rollDice() {
        roll = Roll((Int.random(in: 1...6), Int.random(in: 1...6)))
    }
    
    func reset() {
        roll = nil
    }
}
