//
//  GameStateManager.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/28/25.
//
import SwiftUI

@Observable class GameStateManager {
    var roll: Roll?
    
    init(roll: Roll? = nil) {
        self.roll = roll
    }
    
    func rollDice() {
        roll = Roll((3, 4))
    }
}
