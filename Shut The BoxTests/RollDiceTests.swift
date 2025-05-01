//
//  RollDiceTests.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/30/25.
//

import Testing
@testable import Shut_The_Box

@Suite("RollDiceTests") struct RollDiceTests {
    @Test("Roll 3 4: Available Pegs 7, 1 6, 2 5, 3 4 Should Not Have White Color")
    func roll7_availablePegs1_6_2_5_3_4_shouldNotHaveWhiteColor() {
        let stateManager = GameStateManager(roll: Roll((3, 4)))
        
        stateManager.rollDice()
        
        let colorChangedNumbers = stateManager.availablePegs.filter {
            $0.color != .white
        }.map { $0.number }
        
        #expect(Set(colorChangedNumbers) == Set([7, 1, 6, 2, 5, 3, 4]))
        
//        #expect(!stateManager.availablePegs.contains(where: { $0.color == .white }))
    }
}
