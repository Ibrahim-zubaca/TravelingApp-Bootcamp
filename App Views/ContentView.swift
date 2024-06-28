//
//  ContentView.swift
//  TravelingApp-Bootcamp
//
//  Created by Ibrahim on 28. 6. 2024..
//

import SwiftUI

struct ContentView: View {
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
                            .foregroundColor(.orange)
                            .font(.system(size: 25))
                            .frame(width:70, height: 70)
                            .background(.white)
                            .cornerRadius(50)
                            //.shadow(color: .gray, radius: 4, x:0, y:2)
                        Text(category.name)
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 5)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom,30)
        }
    }
}



//POPULAR DESTINATION SECTION ----------------------------------

struct Destination:Hashable {
    let name, country, imageName: String
}
struct PopularDestinationView: View {
    
    let destination: [Destination] = [
        .init(name: "Sarajevo", country: "B&H", imageName: "Sarajevo"),
        .init(name: "Dubrovnik", country: "Croatia", imageName:"Dubrovnik"),
        .init(name: "Paris", country: "France", imageName: "Paris"),
        .init(name: "Tokyo", country: "Japan", imageName: "Tokyo"),
        .init(name: "New York", country: "USA", imageName: "NewYork")
        
    ]
    var body: some View {
        VStack{
            HStack{
                Text("Popular destination")
                    .font(.headline)
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
                                .frame(width: 180, height: 180)
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
                            //.shadow(radius: 4, x:0, y:0)
                            
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
                
            }
        }
    }
}

//POPULAR PLACES TO EAT SECTION ----------------------------------
struct Restaurants:Hashable {
    let name: String, imageName: String
}
struct PopularRestaurantsView: View {
    
    let restaurants: [Restaurants] = [
        .init(name: "Japanese Sushi", imageName: "sushi"),
        .init(name: "Čevabdžinica Sarajevo", imageName: "cevapi"),
        .init(name: "American Burgers", imageName: "burger"),
    ]
    var body: some View {
        VStack{
            HStack{
                Text("Popular places to eat")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Text("See all")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
            .padding(.top,10)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack (spacing: 8.0) {
                    ForEach(restaurants, id: \.self) { restaurant in
                        HStack(spacing: 8) {
                            Image(restaurant.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipped()
                                .cornerRadius(8)
                                .padding(.leading, 5)
                                .padding(.vertical, 5)
                                
                
                            VStack (alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(restaurant.name)
                                        .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    Spacer()
                                    Button {
                                        //code
                                    } label: {
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.trailing,9)
                                
                                HStack {
                                    Image(systemName: "star.fill")
                                    //Option + 8 for dot
                                    Text("4.7 • Sushi • $$")
                                }
                                .font(.caption)
                                
                                Text("Tokyo, Japan")
                                    .font(.system(size: 12))
                            }
                        }
                            .frame(width: 270)
                            .background(.thinMaterial)
                            .cornerRadius(10)
                            
                            
                            
                    }
                }
                .padding(.horizontal)
                
                
            }
        }
    }
}

//TRENDING CREATORS SECTION ----------------------------------
struct User: Hashable {
    let name, imageName: String
}

struct TrendingCreatorsView: View {
    let creators: [User] = [
        .init(name: "Josh Puke", imageName: "person1"),
        .init(name: "Sara Hall", imageName: "person2"),
        .init(name: "Jake Smith", imageName: "person3"),
        .init(name: "Jamin Doe", imageName: "person4"),
        .init(name: "Josh Puke", imageName: "person1"),
        .init(name: "Sara Hall", imageName: "person2"),
        .init(name: "Jake Smith", imageName: "person3"),
        .init(name: "Jamin Doe", imageName: "person4"),
    ]
    var body: some View {
        
            VStack{
                HStack{
                    Text("Popular Creators")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("See all")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
                .padding(.top,30)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 20){
                        ForEach(creators, id: \.self) { user in
                            VStack {
                                VStack {
                                    Image(user.imageName)
                                        .resizable()
                                        .scaledToFill()
                                }
                                .frame(width: 70, height: 70)
                                .cornerRadius(.infinity)
                                .shadow(color: .gray, radius: 4, x: 0, y: 0)
                                
                                Text(user.name)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .padding(.top, 5)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom)
                    
                }
            }
        }
    }
