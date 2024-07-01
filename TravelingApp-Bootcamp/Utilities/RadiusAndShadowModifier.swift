//
//  RadiusAndShadowModifier.swift
//  TravelingApp-Bootcamp
//
//  Created by Purple Key on 1. 7. 2024..
//

import SwiftUI

struct RadiusAndShadowModifier: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
struct TileModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.thinMaterial)
            .cornerRadius(10)
    }
}

struct RadiusAndShadowModifier_Previews: PreviewProvider {
    static var previews: some View {
        RadiusAndShadowModifier()
    }
}
