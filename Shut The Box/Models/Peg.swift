//
//  Peg.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/29/25.
//
import SwiftUICore

struct Peg: Equatable, Hashable {
    var number: Int
    var color: Color = Color.white
    
    init(_ number: Int) {
        self.number = number
    }
    
    init(_ number: Int, color: Color) {
        self.number = number
        self.color = color
    }
    
    static func ==(lhs: Peg, rhs: Peg) -> Bool {
        return lhs.number == rhs.number
    }
}
