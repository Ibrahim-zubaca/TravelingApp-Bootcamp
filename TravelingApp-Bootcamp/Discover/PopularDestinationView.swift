//
//  PopularDestinationView.swift
//  TravelingApp-Bootcamp
//
//  Created by Purple Key on 28. 6. 2024..
//

import SwiftUI
import MapKit

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
                        NavigationLink(
                            destination: PopularDestinationDetailView(destination: destination),
                            label: {
                                PopularDestinationTile(destination: destination)
                                    .padding(.bottom)
                                    .asTile()
                                    //.shadow(radius: 4, x:0, y:0)
                            })
                        
                            
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
                
                
            }
        }
    }
}

//HORIZONTAL DESTINATION SLIDER
struct PopularDestinationTile: View {
    
    let destination: Destination
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 180, height: 180)
                .cornerRadius(8)
                .padding(5)
                .padding(.top, 0)
            
            
            
            HStack{
                Spacer()
            }
            Text(destination.name)
                .foregroundColor(.black)
                .font(.headline)
                .padding(.horizontal,12)
                .padding(.top, 10)
            
            Text(destination.country)
                .font(.subheadline)
                .padding(.horizontal,12)
                .foregroundColor(.gray)
        }
    }
}

//DESTINATION DETAIL VIEW ---------------------------
struct PopularDestinationDetailView: View {
    
    @State var region = MKCoordinateRegion(center: .init(latitude: 43.855362764465326, longitude: 18.410800638474353), span: .init(latitudeDelta: 0.04, longitudeDelta: 0.04))
    
    let destination: Destination
    
    var body: some View {
        ScrollView{
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 250)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(destination.name)
                    .fontWeight(.bold)
                    .font(.title)
                Text(destination.country)
                HStack {
                    ForEach (0..<5, id: \.self) {num in
                        Image(systemName: "star.fill")
                    }
                    .foregroundColor(.orange)
                }
                .padding(.top,2)
                HStack {
                    Spacer()
                }
            }
            .padding(.horizontal)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean blandit eleifend enim ac tincidunt. Quisque congue id est eget dictum. Nam vel gravida nibh. Pellentesque vel commodo magna. Nullam vel iaculis ipsum. Nunc ultricies nunc id augue porta, a dapibus velit congue. Praesent eros augue, ultricies ut eleifend vitae, blandit non odio. ")
                .padding(.horizontal)
            
            HStack {
                Text("Location")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            Map(coordinateRegion: $region)
                .frame(height: 300)
            
            
    }
        .navigationBarTitle(destination.name, displayMode: .inline)
        
        
}
    
    struct PopularDestinationView_Previews: PreviewProvider {
        static var previews: some View {
            
            PopularDestinationDetailView(destination: .init(name: "Sarajevo", country: "B&H", imageName: "Sarajevo"))
            
            DiscoverView()
        }
    }
}
