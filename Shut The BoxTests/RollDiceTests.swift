//
//  RollDiceTests.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/30/25.
//

import Testing
@testable import Shut_The_Box

@Suite("RollDiceTests") struct RollDiceTests {
    @Test("Roll 5 4: Peg Matches 9, 1 8, 2 7, 3 6, 4 5")
    func roll9_pegMatches_9_1_8_2_7_3_6_4_5_() {
        let stateManager = GameStateManager(roll: Roll((5, 4)))
        stateManager.rollDice()
        let pegMatchNumbers = stateManager.pegMatches?.map { $0.number }
        
        #expect(Set(pegMatchNumbers!) == Set([9, 1, 8, 2, 7, 3, 6, 4, 5]))
    }
    
    @Test("Roll 3 4: Peg Matches 7, 1 6, 2 5, 3 4")
    func roll7_pegMatches_1_6_2_5_3_4_() {
        let stateManager = GameStateManager(roll: Roll((3, 4)))
        stateManager.rollDice()
        let pegMatchNumbers = stateManager.pegMatches?.map { $0.number }
        
        #expect(Set(pegMatchNumbers!) == Set([7, 1, 6, 2, 5, 3, 4]))
    }
    
    @Test("Roll 1 4: Peg Matches 5, 1 4, 2 3")
    func roll5_pegMatches_1_4_2_3_() {
        let stateManager = GameStateManager(roll: Roll((1, 4)))
        stateManager.rollDice()
        let pegMatchNumbers = stateManager.pegMatches?.map { $0.number }

        #expect(Set(pegMatchNumbers!) == Set([1, 2, 3, 4, 5]))
    }
    
    @Test("Roll 1 2: Peg Matches 3, 1 2")
    func roll3_pegMatches_3_1_2_() {
        let stateManager = GameStateManager(roll: Roll((1, 2)))
        stateManager.rollDice()
        let pegMatchNumbers = stateManager.pegMatches?.map { $0.number }
        
        #expect(Set(pegMatchNumbers!) == Set([1, 2, 3]))
    }
}
