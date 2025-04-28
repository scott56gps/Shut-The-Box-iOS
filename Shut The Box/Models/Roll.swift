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
    
    init(firstDie: Int, secondDie: Int) {
        self.firstDie = firstDie
        self.secondDie = secondDie
        self.total = firstDie + secondDie
    }
}
