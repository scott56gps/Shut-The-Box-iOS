//
//  GameStateManager.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/28/25.
//
import SwiftUI

@Observable class GameStateManager {
    var roll: Roll?
    
    func rollDice() {
        roll = Roll(firstDie: 3, secondDie: 4)
    }
}
