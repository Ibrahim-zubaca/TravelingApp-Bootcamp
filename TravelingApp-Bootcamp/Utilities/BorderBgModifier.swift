//
//  BorderBgModifier.swift
//  TravelingApp-Bootcamp
//
//  Created by Purple Key on 1. 7. 2024..
//

import SwiftUI


extension View {
    func asTile() -> some View {
        modifier(TileModifier())
    }
}
struct TileModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.thinMaterial)
            .cornerRadius(10)
    }
}
