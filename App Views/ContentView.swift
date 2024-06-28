//
//  ContentView.swift
//  TravelingApp-Bootcamp
//
//  Created by Ibrahim on 28. 6. 2024..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                DiscoverCategoryView()
                
                
                
            }
            .navigationTitle("Discover")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//EXTRACTED VIEWS AND COMPONENTS
//CATEGORY SECTION ----------------------------------
struct DiscoverCategoryView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8){
                ForEach(0..<16, id: \.self) { num in
                    VStack {
                        Spacer()
                            .frame(width: 60, height: 60)
                            .background(.gray)
                            .cornerRadius(.infinity)
                        Text("Art")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .padding(.top, 5)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
