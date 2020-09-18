//
//  Travel_LazyView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/18.
//

import SwiftUI
import SDWebImageSwiftUI

struct Travel_LazyView: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                HStack {
                     Text("Look At  \n Another World")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                
                /// top Header
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing : 15) {
                        
                        ForEach(1...5, id : \.self) { i in
                            
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 60, height: 60)
                                .onTapGesture {
                                    print(" Tap \(i)")
                                }
                            
                        }
                    }
                    .padding()
                }
                
                HStack {
                     Text("Destination")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("See All")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                
                ForEach(spots) { travel in
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        
                        /// Z1
                        WebImage(url: travel.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .cornerRadius(25)
                        
                        VStack(alignment: .trailing, spacing: 8) {
                            
                            Text(travel.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text(travel.country)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding()
                        
                        
                    }
                    .padding()
                    .onTapGesture {
                        print("Tap")
                    }
                        
                    
                }
                
                
            }
        }
    }
}

fileprivate struct TravelModel : Identifiable {
    var id = UUID().uuidString
    var title : String
    var country : String
    var rating : String
    var price : String
    var image : URL
}

fileprivate var spots = [
    TravelModel(title: "New York", country: "USA", rating: "4.7", price: "$300", image: getExampleImageUrl("travel")),
    TravelModel(title: "Carribian", country: "French", rating: "4.1", price: "$450", image: getExampleImageUrl("travel")),

    
]



struct Travel_LazyView_Previews: PreviewProvider {
    static var previews: some View {
        Travel_LazyView()
    }
}
