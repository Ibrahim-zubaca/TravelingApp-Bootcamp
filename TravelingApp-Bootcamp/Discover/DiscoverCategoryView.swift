//
//  DiscoverCategoryView.swift
//  TravelingApp-Bootcamp
//
//  Created by Purple Key on 28. 6. 2024..
//

import SwiftUI

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
                    NavigationLink {
                    CategoryDetailView()
                    } label: {
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
            }
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom,30)
        }
    }
}

struct CategoryDetailView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<5, id: \.self){ num in
                VStack (alignment: . leading, spacing: 0) {
                    Image("Sarajevo")
                        .resizable()
                        .scaledToFill()
                    Text("Sarajevo - Muzej iluzija")
                        .font(.subheadline)
                        .padding()
                        
                }
                .asTile()
                .padding()
            }
            
        }
        .navigationBarTitle("Category", displayMode: .inline)
    }
}

struct DiscoverCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverCategoryView()
    }
}
