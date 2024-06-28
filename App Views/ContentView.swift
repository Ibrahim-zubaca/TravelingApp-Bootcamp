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
                PopularDestinationView()
                PopularRestaurantsView()
                TrendingCreatorsView()
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
struct Category: Hashable {
    let name, imageName: String
}

struct DiscoverCategoryView: View {
    
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Envents", imageName: "music.mic"),
        .init(name: "Food", imageName: "fork.knife"),
        .init(name: "History", imageName: "building.columns")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16){
                ForEach(categories, id: \.self) { category in
                    VStack {
                        Image(systemName: category.imageName)
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .frame(width:70, height: 70)
                            .background(Color.gray)
                            .cornerRadius(50)
                            .shadow(color: .gray, radius: 4, x:0, y:2)
                        Text(category.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 5)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}



//POPULAR DESTINATION SECTION ----------------------------------
struct PopularDestinationView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Popular destination")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Text("See all")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
            .padding(.top,30)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Rectangle()
                            .frame(width: 150, height: 180)
                            .cornerRadius(10)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                
            }
        }
    }
}

//POPULAR PLACES TO EAT SECTION ----------------------------------
struct PopularRestaurantsView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Popular places to eat")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Text("See all")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
            .padding(.top,30)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Rectangle()
                            .frame(width: 200, height:64)
                            .cornerRadius(10)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                
            }
        }
    }
}

//TRENDING CREATORS SECTION ----------------------------------
struct TrendingCreatorsView: View {
    var body: some View {
        
            VStack{
                HStack{
                    Text("Popular Creators")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("See all")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
                .padding(.top,30)
                
                ScrollView(.horizontal, showsIndicators: false){
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
                    .padding(.top)
                    
                }
            }
        }
    }
