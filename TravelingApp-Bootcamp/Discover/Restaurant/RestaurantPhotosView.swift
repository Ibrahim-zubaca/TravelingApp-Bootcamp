//
//  RestaurantPhotosView.swift
//  TravelingApp-Bootcamp
//
//  Created by Purple Key on 2. 7. 2024..
//

import SwiftUI

struct RestaurantPhotosView: View {
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                //GRID
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: proxy.size.width / 3 - 6, maximum: 300), spacing: 3)
                    ],
                    spacing: 4,
                    content: {
                        ForEach(0..<30, id: \.self) {num in
                            Image("Sarajevo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: proxy.size.width / 3 - 5, height: proxy.size.width / 3)
                                .clipped()
                        }
                        
                    }).padding(.horizontal, 3)
            }.navigationBarTitle("All photos", displayMode: .inline)
            
        }
        
    }
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        RestaurantPhotosView()
        }
        
    }
}
