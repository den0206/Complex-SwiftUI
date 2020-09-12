//
//  ShoesShopView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/12.
//

import SwiftUI
import SDWebImageSwiftUI

struct ShoesShopView: View {
    
    //MARK: - Property
    
    @State private var index = 0
    
    var body: some View {
    
        
        ZStack {
            //MARK: - Z1
            VStack(spacing : 0) {
                
                ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            Spacer(minLength: 0)
                            
                            Text("Shoes Shop")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Image(systemName: "list.bullet")
                                .font(.system(size: 22))
                                .foregroundColor(.gray)
                        }
                        .padding()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack(spacing : 30) {
                                
                                ForEach(0..<topMenu.count) { menu in
                                    
                                    TopMenuView(menu: menu, index: $index)
                                    
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.top,10)
                        
                        HStack {
                            VerticalMenuView()
                                .padding(.leading, -165)
                                .zIndex(1)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack(spacing : 15) {
                                    
                                    ForEach(1...6, id : \.self) { i in
                                        
                                        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                                            
                                            Image(systemName: "house")
                                                .resizable()
                                                .frame(height : 110)
                                                .foregroundColor(Color.black.opacity(0.8))
                                                .padding(.top, 55)
                                                .padding(.horizontal)
                                            
                                            VStack(alignment : .leading) {
                                                Text("$200")
                                                    .font(.system(size: 22))
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                                
                                                Spacer(minLength: 0)
                                                
                                                WebImage(url: getExampleImageUrl("shoes"))
                                                    .resizable()
                                                    .frame(width: 180, height: 180)
                                                    .aspectRatio(contentMode: .fit)
                                                    .cornerRadius(22)
                                                    .rotationEffect(.init(degrees: 12))
                                                
                                                Spacer(minLength: 0)
                                                
                                                Text("Men's shoes")
                                                    .foregroundColor(Color.black.opacity(0.7))
                                                    .padding(.top, 10)
                                                    
                                                
                                                Spacer(minLength: 0)
                                                
                                                Text("Sample Description")
                                                    .font(.system(size: 22))
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                                
                                            }
                                        }
                                        .padding(.horizontal)
                                        .padding(.vertical)
                                        .frame(width: UIScreen.main.bounds.width - 150, height: 360)
                                        .background(Color.random)
                                        .cornerRadius(15)
                                        .onTapGesture {
                                            print("Tap")
                                        }
                                        
                                    }
                                }
                                .padding(.leading, 20)
                                .padding(.trailing)
                            }
                            .padding(.leading, -165)
                        }
                        .padding(.top, 30)
                        .frame(height : 400)
                        
          
                    }
                }
            }
        }
    }
}
struct TopMenuView : View {
    
    var menu : Int
    @Binding var index : Int
    
    var body: some View {
        VStack(spacing : 8) {
            Text(topMenu[menu])
                .font(.system(size: 32))
                .fontWeight(index == menu ? .bold : .none)
                .foregroundColor(index == menu ? .black : .gray)
            
            Circle()
                .fill(Color.black)
                .frame(width: 10, height: 10)
                .opacity(index == menu ? 1 : 0)
        }
        .onTapGesture {
            
            withAnimation {
                index = menu
                
            }
        }
    }
}

struct VerticalMenuView : View{
    
    @State private var index = 0
    
    var body: some View {
        
        HStack(spacing : 0) {
            
            /// men Button
            Button(action: {
                index = 0
            }) {
                VStack(spacing : 5) {
                    
                    Text("Men")
                        .fontWeight(index == 0 ? .bold : .none)
                        .foregroundColor(index == 0 ? .black : .gray)
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 8, height: 8)
                        .opacity(index == 0 ? 1 : 0)
                    
                }
                
              
                
            }
            .padding(.leading)
            

            
            Spacer(minLength: 0)
            
            /// women Button
            Button(action: {
                index = 1
            }) {
                VStack(spacing : 5) {
                    
                    Text("Women")
                        .fontWeight(index == 1 ? .bold : .none)
                        .foregroundColor(index == 1 ? .black : .gray)
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 8, height: 8)
                        .opacity(index == 1 ? 1 : 0)
                    
                }
         
            }
            
            
            Spacer(minLength: 0)

            /// kids Button
            Button(action: {
                index = 2
            }) {
                VStack(spacing : 5) {
                    
                    Text("Kids")
                        .fontWeight(index == 2 ? .bold : .none)
                        .foregroundColor(index == 2 ? .black : .gray)
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 8, height: 8)
                        .opacity(index == 2 ? 1 : 0)
                    
                }
     
            }
            
            Spacer(minLength: 0)
            
            /// custom Buttn
            Button(action: {
                index = 3
            }) {
                
                VStack(spacing : 5) {
                    
                    Text("Custom")
                        .fontWeight(index == 3 ? .bold : .none)
                        .foregroundColor(index == 3 ? .black : .gray)
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 8, height: 8)
                        .opacity(index == 3 ? 1 : 0)
                    
                }
                
                
            }
            
            .padding(.trailing)
            
            
            
        }
        .padding(.vertical,30)
        .frame(width: 400)
        .background(Color.black.opacity(0.1))
        .cornerRadius(15)
        .rotationEffect(.init(degrees: -90))
    }
}

struct ShoesShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShoesShopView()
    }
}

//MARK: - propety

fileprivate let topMenu = ["Shoes","Clothing","By Sports","By Brand","By Price"]
