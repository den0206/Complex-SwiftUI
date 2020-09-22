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
        ScrollView(.vertical, showsIndicators: false) {
            
            ForEach(gifData, id : \.self) { url in
                
                HStack {
                    Spacer(minLength: 0)
                    
                    AnimatedImage(url: URL(string: url))
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 100, height: 200)
                        .cornerRadius(15)
                }
                .padding()
            }
        }
    }
}

struct Giphy_AppView_Previews: PreviewProvider {
    static var previews: some View {
        Giphy_AppView()
    }
}
