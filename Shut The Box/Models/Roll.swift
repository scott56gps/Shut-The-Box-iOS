//
//  Roll.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/28/25.
//

import Foundation

struct Roll {
    let firstDie: Int
    let secondDie: Int
    let total: Int
    
    init(_ dice:(Int, Int)) {
        self.firstDie = dice.0
        self.secondDie = dice.1
        self.total = self.firstDie + self.secondDie
    }
}
