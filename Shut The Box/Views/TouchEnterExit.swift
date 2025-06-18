//
//  TouchEnterExit.swift
//  Shut The Box
//
//  Created by Scott Nicholes on 6/17/25.
//
//  Borrowed from https://swiftuirecipes.com/blog/swiftui-touch-enter-and-exit-gesture

import SwiftUI

struct TouchEnterExit: ViewModifier {
    @GestureState private var dragLocation: CGPoint = .zero
    @State private var didEnter = false
    
    let onEnter: (() -> Void)?
    let onExit: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .global)
                    .updating(self.$dragLocation) { value, state, _ in
                        state = value.location
                    }
            )
            .background(GeometryReader { proxy in
                dragObserver(proxy)
            })
    }
    
    private func dragObserver(_ proxy: GeometryProxy) -> some View {
        if proxy.frame(in: .global).contains(dragLocation) {
            DispatchQueue.main.async {
                didEnter = true
                onEnter?()
            }
        } else if didEnter {
            DispatchQueue.main.async {
                didEnter = false
                onExit?()
            }
        }
        return Color.clear
    }
}

extension View {
    func touchEnterExit(onEnter: (() -> Void)? = nil, onExit: (() -> Void)? = nil) -> some View {
        self.modifier(
            TouchEnterExit(onEnter: onEnter, onExit: onExit)
        )
    }
}
