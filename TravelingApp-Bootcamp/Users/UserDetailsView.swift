//
//  UserDetailsView.swift
//  TravelingApp-Bootcamp
//
//  Created by Purple Key on 2. 7. 2024..
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    var body: some View {
        ScrollView (showsIndicators: false) {
            Image(user.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding()
            
            Text(user.name)
                .font(.title2)
                .padding(.bottom, 0)
            HStack {
                Text("@\(user.name) •")
                    .font(.subheadline)
                
                Image(systemName: "hand.thumbsup.fill")
                
                Text("2076")
            }
            .font(.subheadline)
            
            Text("Youtuber • Vloger • Travel Creator")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top,8)
            
            HStack(spacing: 24) {
                VStack{
                    Text("59,384")
                        .fontWeight(.semibold)
                    Text("Subscribers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                    .frame(width: 1, height: 30)
                    .background(Color(.lightGray))
                
                VStack{
                    Text("2034")
                        .fontWeight(.semibold)
                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }.padding(.top)
            
            HStack (spacing: 10) {
                Button {
                    //Code goes here
                } label: {
                    HStack {
                        Spacer()
                        Text("Follow")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.vertical,8)
                    .background(.orange)
                    .cornerRadius(50)
                    
            }
                Button {
                    //Code goes here
                } label: {
                    HStack {
                        Spacer()
                        Text("Contact")
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.vertical,8)
                    .background(.thickMaterial)
                    .cornerRadius(50)
                    
            }
            }
            .padding(.bottom,30)
            .padding(.top,20)
            
            ForEach(0..<5, id: \.self){num in
                VStack(alignment: .leading, spacing: 16) {
                    Image("NewYork")
                        .resizable()
                        .scaledToFill()
                        
                    
                    HStack {
                        Image("person4")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60)
                            .clipShape(Circle())
                        VStack (alignment: .leading){
                            Text("Traveling in NYC - 2024")
                                .fontWeight(.semibold)
                            Text("200k views")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                        
                        
                    }
                    HStack {
                        Text("#Traveling")
                            .font(.caption)
                            .padding(.horizontal)
                            .padding(.vertical,3)
                            .foregroundColor(.white)
                            .background(.orange)
                            .cornerRadius(10)
                        
                        Text("#B&H")
                            .font(.caption)
                            .padding(.horizontal)
                            .padding(.vertical,3)
                            .foregroundColor(.white)
                            .background(.orange)
                            .cornerRadius(10)
                        
                        Text("#Sarajevo")
                            .font(.caption)
                            .padding(.horizontal)
                            .padding(.vertical,3)
                            .foregroundColor(.white)
                            .background(.orange)
                            .cornerRadius(10)
                            
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                .background(.thinMaterial)
                
                
                
                .cornerRadius(12)
                    
            }
            .padding(.bottom)
            

            
            
        }.navigationBarTitle(user.name, displayMode: .inline)
            .padding(.horizontal)
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailsView(user: .init(name: "Amy Adams", imageName: "person4"))
        }
        
    }
}
