//
//  ColorExtensions.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 5/1/25.
//
import SwiftUI

/**
 Author: Daniel Saidi
 Taken from his website at: https://danielsaidi.com/blog/2022/05/25/generating-a-random-color
 */
public extension Color {

    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}
