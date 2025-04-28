//
//  CTAButton.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 4/28/25.
//
import SwiftUI

struct CTAButton: View {
    var label: String
    var action: () -> Void
    var backgroundColor: Color = .blue
    
    init(_ label: String, _ action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }

    var body: some View {
        Button(
            action: action,
            label: {
                Text(label)
                    .font(.title)
                    .foregroundStyle(Color.black)
                    .padding(12)
                    .background(backgroundColor, in: RoundedRectangle(cornerRadius: 12))
            })
    }
}

#Preview {
    CTAButton("Roll!") {
        print("rolled")
    }
}
