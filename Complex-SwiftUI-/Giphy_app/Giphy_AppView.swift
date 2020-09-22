//
//  Giphy_AppView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct Giphy_AppView: View {
    
    @State private var gifData = [String]()
    @State private var present = false
    @State private var url = ""
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                ForEach(gifData, id : \.self) { url in
                    
                    HStack {
                        Spacer(minLength: 0)
                        
                        AnimatedImage(url: URL(string: url))
                            .aspectRatio(contentMode: .fit)
//                            .resizable()
//                            .frame(width: UIScreen.main.bounds.width - 100, height: 200)
                            .clipShape(GiphyShape())
                    }
                    .padding()
                }
                .onChange(of: url) { (value) in
                    self.gifData.append(value)
                }
                .navigationTitle("GIF")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button(action: {present.toggle()}) {
                        Image(systemName: "rectangle.and.paperclip")
                            .font(.title)
                    }
                }
            }
            .fullScreenCover(isPresented: $present) {
                GIFController(url: $url, present: $present)
            }
        }
        
    }
}

struct GiphyShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,.bottomRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}
