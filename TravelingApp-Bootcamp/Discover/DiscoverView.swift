//
//  ContentView.swift
//  TravelingApp-Bootcamp
//
//  Created by Ibrahim on 28. 6. 2024..
//

import SwiftUI

struct DiscoverView: View {
    //Init to change title bar color in whole app
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView {
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .padding(.horizontal)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    
                    DiscoverCategoryView()
                    
                    VStack {
                    PopularDestinationView()
                    PopularRestaurantsView()
                    TrendingCreatorsView()
                    }
                    .background(.thinMaterial)
                    .cornerRadius(25)
                    
                    }
            }
            
            .navigationTitle("Discover")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}












