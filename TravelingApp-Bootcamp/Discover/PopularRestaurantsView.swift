//
//  PopularRestaurantsView.swift
//  TravelingApp-Bootcamp
//
//  Created by Purple Key on 28. 6. 2024..
//

import SwiftUI

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
                            .asTile()
                            
                            
                            
                    }
                }
                .padding(.horizontal)
                
                
            }
        }
    }
}

struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularRestaurantsView()
    }
}
