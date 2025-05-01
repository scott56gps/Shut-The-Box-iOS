//
//  Shut_The_BoxTests.swift
//  Shut The BoxTests
//
//  Created by Scott Nicholes on 4/24/25.
//

import Testing
@testable import Shut_The_Box

@Suite("Get Available Pairs Tests") struct GetAvailablePairsTests {
    @Test("2 Only Returns (0, 2)") func Sum2_2() {
        let manager = GameStateManager()
        #expect(
            manager.getAvailablePairs(sum: 2).allSatisfy(
                { (
                    first,
                    second
                ) in
                    first == 0 && second == 2
                })
        )
    }

    @Test("Numbers Greater Than 9 Are Not In The Result") func SumGreaterThan9_NotInResult() {
        let manager = GameStateManager()
        #expect(
            manager.getAvailablePairs(sum: 10).filter(
                { (
                    first,
                    second
                ) -> Bool in
                    return first == 0 && second == 10
                }).isEmpty
        )
        
        #expect(
            manager.getAvailablePairs(sum: 11).filter(
                { (
                    first,
                    second
                ) -> Bool in
                    return (first == 0 && second == 11) || (
                        first == 1 && second == 11
                    )
                }).isEmpty
        )
        
        #expect(
            manager.getAvailablePairs(sum: 12).filter(
                { (
                    first,
                    second
                ) -> Bool in
                    return (first == 0 && second == 12) || (first == 1 && second == 11) || (
                        first == 2 && second == 10
                    )
                }).isEmpty
        )
    }
    
    @Test("7 With [1,5,7,9] Only Returns (0, 7)") func Sum7_WithArray_Only7() {
        let manager = GameStateManager(numbers: [1,5,7,9])
        #expect(
            manager.getAvailablePairs(sum: 7).contains(
                where: { (
                    first,
                    second
                ) in
                    first == 0 && second == 7
                })
        )
    }
    
    @Test("8 With [1,5,7,9] Returns (1, 7)") func Sum8_WithArray_Only1_7() {
        let manager = GameStateManager(numbers: [1,5,7,9])
        #expect(manager.getAvailablePairs(sum: 8).contains(where: { (first, second) in
            first == 1 && second == 7
        }))
    }

    
    @Test("8 With [1,5,9] Returns Empty Array") func Sum8_WithIncompleteNumbers_EmptyArray() {
        let manager = GameStateManager(numbers: [1,5,9])
        #expect(manager.getAvailablePairs(sum: 8).isEmpty)
    }
}
