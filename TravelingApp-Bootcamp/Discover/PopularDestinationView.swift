//
//  PopularDestinationView.swift
//  TravelingApp-Bootcamp
//
//  Created by Purple Key on 28. 6. 2024..
//

import SwiftUI

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
                            .asTile()
                            //.shadow(radius: 4, x:0, y:0)
                            
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
                
            }
        }
    }
}


struct PopularDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationView()
        DiscoverView()
    }
}
