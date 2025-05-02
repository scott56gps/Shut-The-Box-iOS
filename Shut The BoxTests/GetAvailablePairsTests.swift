//
//  Shut_The_BoxTests.swift
//  Shut The BoxTests
//
//  Created by Scott Nicholes on 4/24/25.
//

import Testing
@testable import Shut_The_Box

@Suite("Get Available Pairs Tests") struct GetAvailablePairsTests {
    @Test("9 With [1,2,3,4,5,6,7,8,9] Returns (0,9), (1,8), (2,7), (3,6), (4,5)")
    func Sum9() {
        let manager = GameStateManager()
        #expect(manager.getAvailablePairs(sum: 9).allSatisfy(
            { (
                first,
                second
            ) in
                switch (first, second) {
                case (0, 9): true
                case (1, 8): true
                case (2, 7): true
                case (3, 6): true
                case (4, 5): true
                default: false
                }
            }))
    }
    
    @Test("5 With [1,2,3,4,5,6,7,8,9] Returns (0,5), (1,4), (2,3)") func Sum5() {
        let manager = GameStateManager()
        #expect(manager.getAvailablePairs(sum: 5).allSatisfy(
            { (
                first,
                second
            ) in
                switch (first, second) {
                case (0, 5): true
                case (1, 4): true
                case (2, 3): true
                default: false
                }
            }))
    }
    
    @Test("3 With [1,2,3,4,5,6,7,8,9] Returns (0,3), (1,2)") func Sum3() {
        let manager = GameStateManager()
        #expect(manager.getAvailablePairs(sum: 3).allSatisfy { pair in
            switch pair {
            case (0, 3): return true
            case (1, 2): return true
            default: return false
            }
        })
    }
    
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
        #expect(
            manager.getAvailablePairs(sum: 8).contains(
                where: { (
                    first,
                    second
                ) in
                    first == 1 && second == 7
                })
        )
    }

    
    @Test("8 With [1,5,9] Returns Empty Array") func Sum8_WithIncompleteNumbers_EmptyArray() {
        let manager = GameStateManager(numbers: [1,5,9])
        #expect(manager.getAvailablePairs(sum: 8).isEmpty)
    }
}
