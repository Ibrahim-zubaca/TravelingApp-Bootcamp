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

struct Place: Decodable, Hashable {
    let name, thumbnail: String
}

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Place]()
    
    init() {
        //Network code will hapen here
        //Real network code
        guard let url = URL(string:"https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            //You want to check resp statusCOde and err
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                guard let data = data else { return }
                
                
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    print("Failed to decode JSON")
                }
                
                self.isLoading = false
                //self.places = [1]
            }
        }.resume()
    }
}

//Loader code ----------------
struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
            aiv.startAnimating()
        aiv.color = .white
            return aiv
    }
    
    typealias UIViewType = UIActivityIndicatorView
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}
//-----------------------

import Kingfisher
import SDWebImageSwiftUI

struct CategoryDetailView: View {
    @ObservedObject var vm = CategoryDetailsViewModel()
    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack {
                    ActivityIndicatorView()
                    Text("Loading")
                        .foregroundColor(.white)
                        .font(.subheadline)
                }
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                
            }
            else {
                
                ScrollView {
                    ForEach(vm.places, id: \.self){ place in
                        VStack (alignment: . leading, spacing: 0) {
                            KFImage(URL(string: place.thumbnail))
                                .resizable()
                                .scaledToFill()
                            Text(place.name)
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
        
    }
}

struct DiscoverCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverCategoryView()
        CategoryDetailView()
    }
}
