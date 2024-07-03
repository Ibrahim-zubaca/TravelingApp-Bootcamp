//
//  TrendingCreatorsView.swift
//  TravelingApp-Bootcamp
//
//  Created by Purple Key on 28. 6. 2024..
//

import SwiftUI

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
                            NavigationLink(
                                destination: UserDetailsView(user: user),
                                label: {
                                    DiscoverUserView(user: user)
                                })
                            
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom)
                    
                }
            }
        }
    }

struct DiscoverUserView: View {
    
    let user: User
    var body: some View {
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
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .padding(.top, 5)
        }
    }
}
struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
    }
}
