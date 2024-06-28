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

struct Destination:Hashable {
    let name, country, imageName: String
}
struct PopularDestinationView: View {
    
    let destination: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "Paris"),
        .init(name: "Tokyo", country: "Japan", imageName: "Tokyo"),
        .init(name: "New York", country: "USA", imageName: "NewYork"),
    ]
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
                HStack (spacing: 10) {
                    ForEach(destination, id: \.self) { destination in
                        VStack (alignment: .leading, spacing: 0){
                            
                            Image(destination.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 100)
                                .cornerRadius(8)
                                .padding(5)
                                .padding(.top, 0)
                                
                            Spacer()
                            
                            HStack{
                                Spacer()
                            }
                            Text(destination.name)
                                .font(.headline)
                                .padding(.horizontal,12)
                            
                            Text(destination.country)
                                .font(.subheadline)
                                .padding(.horizontal,12)
                                .foregroundColor(.gray)
                        }
                            .padding(.bottom)
                            .background(.thinMaterial)
                            .cornerRadius(10)
                            .shadow(radius: 4, x:0, y:2)
                            
                    }
                    .padding(.vertical)
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
