//
//  GameStateAlgorithms.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/29/25.
//
import Foundation

extension GameStateManager {
    /**
     Creates a list of pairs of numbers that add to the given sum using the current state of available numbers.
     The first part of each pair will always be less than the second part, and pairs do not contain duplicate numbers.
     (e.g. (3,3) is not included).
     A single pair containing a 0 as its first part indicates that the sum itself is included.
     */
    func getAvailablePairs(sum: Int) -> [(Int, Int)] {
        var result: [(Int, Int)] = []
        if sum <= 9 && self.availableNumbers.contains(sum) {
            result.append((0, sum))
        }
        return sum == 2 ? result : findPairs(
            sum: sum,
            result: result,
            availableNumbers: self.availableNumbers
        )
    }
    
    private func findPairs(sum: Int, result: [(Int, Int)], availableNumbers: [Int]) -> [(Int,Int)] {
        let maxModulus = min(sum-1, 9)
        let midpoint = sum / 2
        let minModulus = (midpoint.isMultiple(of: 2) && midpoint != 2 && sum != 9 ? midpoint : midpoint+1)

        return (minModulus...maxModulus).reversed()
            .reduce(into: result) { (acc, j) in
                if availableNumbers.contains(j) && availableNumbers.contains(sum % j) {
                    acc.append((sum % j, j))
                }
            }
    }
}
