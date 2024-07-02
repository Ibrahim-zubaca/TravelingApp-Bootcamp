//
//  PopularRestaurantsView.swift
//  TravelingApp-Bootcamp
//
//  Created by Purple Key on 28. 6. 2024..
//

import SwiftUI

//RESTAURANTS MAIN PAGE SLIDER ----------------------------------
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
                        NavigationLink(
                            destination: RestaurantDetailsView(restaurant: restaurant),
                            label: {RestaurantTile(restaurant: restaurant)})
                        
                            
                            
                            
                    }
                }
                .padding(.horizontal)
                
                
            }
        }
    }
}

//RESTAURANT DETAIL VIEW -----------------------------------------------
struct RestaurantDetailsView: View {
    let restaurant: Restaurants
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                Image(restaurant.imageName)
                    .resizable()
                    .scaledToFill()
                    
                
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                
                HStack {
                    VStack (alignment: .leading) {
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.title)
                        .fontWeight(.semibold)
                        
                        HStack {
                            ForEach(0..<5, id: \.self) {num in
                            Image(systemName: "star.fill")
                                    .foregroundColor(.orange)
                                    
                            }
                        }
                        
                    }
                    Spacer()
                    Text("See more photos")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 80)
                }
                .padding()
                
            }
            VStack(alignment: .leading) {
                Text("Location & Description")
                    .fontWeight(.semibold)
                    .font(.headline)
                Text("Location & Description")
                    .font(.subheadline)
                HStack {
                    Spacer()
                }
                
                HStack {
                    ForEach(0..<3, id: \.self) {num in
                    Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.orange)
                            .font(.title2)
                            
                    }
                }
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed aliquam tortor, sed blandit eros. Maecenas eleifend eleifend nisi non porttitor. Nam dignissim, nunc quis porttitor sagittis, dui ligula mattis dui, non ultricies turpis nulla vestibulum nisl. ")
                    .font(.subheadline)
                    .padding(.top, 8)
                
            }
            .padding()
            HStack{
                Text("Popular Dishes")
                    .fontWeight(.semibold)
                    .font(.headline)
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack (spacing: 16) {
                    ForEach (0..<5, id: \.self){num in
                        VStack(alignment: .leading) {
                            Image(restaurant.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 100)
                                .cornerRadius(8)
                            
                            Text("Lorem ipsum")
                                .font(.subheadline)
                            
                            Text("128 Photos")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
            }
            
            
        }
        .navigationTitle("Restaurant Details")
        .navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}

//RESTAURANT CARD COMPONENT -----------------------------------------------
struct RestaurantTile: View {
    let restaurant: Restaurants
    
    var body: some View {
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
        .foregroundColor(.black)
            .frame(width: 270)
            .asTile()
    }
}
struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularRestaurantsView()
        NavigationView {
            RestaurantDetailsView(restaurant: .init(name: "Japanese Sushi", imageName: "sushi"))
        }
        
    }
}


