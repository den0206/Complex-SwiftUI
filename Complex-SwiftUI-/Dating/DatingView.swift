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
        
        
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            
            WebImage(url: human.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: frame.width, height: frame.height)
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                
                (human.offSet > 0 ? Color.green : Color.pink)
                    .opacity(human.offSet != 0 ? 0.7 : 0)
                
                HStack {
                    if human.offSet < 0 {
                        Spacer()
                    }
                    
                    Text(human.offSet == 0 ? "" : (human.offSet > 0 ? "Like"  : "Rehject"))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 25)
                        .padding(.horizontal)
                    
                    if human.offSet > 0 {
                        Spacer()
                    }
                }
               
            }
            
            LinearGradient(gradient: .init(colors: [Color.black.opacity(0),Color.black.opacity(0.4)]), startPoint: .center, endPoint: .bottom)
            
            VStack(spacing : 20) {
                
                HStack  {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(human.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(human.age + " +")
                            .font(.body)
                    }
                    .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
    
                }
                
                HStack(spacing : 35) {
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {withAnimation(Animation.easeIn(duration: 0.8)) {
                        human.offSet = -500
                    }}, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 24,weight : .bold))
                            .padding(.all, 20)
                            .background(Color.pink)
                            .clipShape(Circle())
                    })
                    
                    Button(action: {withAnimation(Animation.easeIn(duration: 0.8)) {
                        human.offSet = 500
                    }}, label: {
                        Image(systemName: "checkmark")
                            .font(.system(size: 24,weight : .bold))
                            .padding(.all, 20)
                            .background(Color.green)
                            .clipShape(Circle())
                    })
                    
                    
                    Spacer(minLength: 0)
                   
                }
            }
            .padding(.all)
            
        })
        .cornerRadius(20)
        .offset(x: human.offSet)
        .rotationEffect(.init(degrees: human.offSet == 0 ? 0 : (human.offSet > 0 ? 12 : -12)))
        .gesture(
            DragGesture().onChanged({ (value) in
                withAnimation{
                    human.offSet = value.translation.width
                }
            }).onEnded({ (value) in
                withAnimation {
                    if human.offSet > 150 {
                        human.offSet = 500
                    } else if human.offSet < 150 {
                        human.offSet = -500
                    } else {
                        human.offSet = 0
                    }
                }
            })
            
        )
    }
}

struct DatingView_Previews: PreviewProvider {
    static var previews: some View {
        DatingView()
    }
}

