//
//  DatingView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/07.
//

import SwiftUI
import SDWebImageSwiftUI

struct DatingView: View {
    
    var body: some View {
        
        VStack {
            HStack(spacing : 20) {
                
                Button(action: {
                    getUrl()
                }) {
                    Image(systemName: "list.dash")
                        .font(.system(size: 22))
                        .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
              
                
                Text("Let's Meet")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer(minLength: 0)
                
                Button(action: {}) {
                    Image(systemName: "info.circle.fill")
                        .font(.system(size: 22))
                        .foregroundColor(.gray)


                }
            }
            .padding()
            
            GeometryReader  {g in
                
                ZStack {
                    ForEach(profiles.reversed()) { pep in
                        
                        ProfileView(human: pep, frame: g.frame(in: .global))
                    }
                }
            }
            .padding([.horizontal, . bottom])
            
            Spacer(minLength: 0)
            
            
            
            
        }
        .background(Color.black.opacity(0.06)).edgesIgnoringSafeArea(.all)
    }
}

struct ProfileView : View {
    
    @State var human : SampleHuman
    var frame : CGRect
    
    var body: some View {
        
        ZStack {
            
            WebImage(url: human.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: frame.width, height: frame.height)
                .cornerRadius(20)
            
        }
    }
}

struct DatingView_Previews: PreviewProvider {
    static var previews: some View {
        DatingView()
    }
}
