//
//  Furniture_AppView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/23.
//

import Foundation
import SwiftUI

struct Furniture_AppView : View {
    
    @State private var searchText = ""
    @State private var selectedMenu = "All"
    @State private var selectedItem : Furniture_Model = furniture_Models[0]
    @State private var show = false
    @Namespace var animation
    
    
    var body: some View {
        
      
            VStack {
                
                HStack {
                    Text("Dashboard")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                            
                            Image(systemName: "bell")
                                .font(.system(size: 25))
                                .foregroundColor(.white)
                            
                            Circle()
                                .fill(Color.red)
                                .frame(width: 12, height: 12)
                        }
                    }
                    
                }
                .padding()
                
                /// search area
                HStack(spacing : 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    TextField("search", text: $searchText)
                        .preferredColorScheme(.dark)
                }
                .padding()
                .background(Color(.systemGray3))
                .cornerRadius(15)
                .padding()
                
                HStack(spacing : 0) {
                    
                    ForEach(furniture_menus, id : \.self) { title in
                        MenuButton(title: title, selectedMenu: $selectedMenu)
                        
                        if title != furniture_menus.last {
                            Spacer(minLength: 0)
                        }
                        
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing : 15) {
                        
                        ForEach(furniture_Models) { item in
                            
                            Furniture_CardView(item: item, animation: animation)
                                .shadow(color: Color.black.opacity(0.16), radius: 5, x: 0, y: 5)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedItem = item
                                        self.show = true
                                    }
                                }
                                .sheet(isPresented: $show) {
                                    Furniture_DetailView(item: $selectedItem, show: $show,animation: animation)
                                }
                            
                        }
                    }
                    .padding(.horizontal,22)
                }
                .padding(.vertical)
                .background(Color.white.clipShape(CustomCorner(corners: [.topLeft,.topRight], size: 55)).ignoresSafeArea(.all, edges: .bottom))
                .padding(.top,10)
              
                
            }
            .background(Color.blue.ignoresSafeArea(.all, edges: .all))
     
    }
}

var furniture_menus = ["All","Sofa","Park bench","ArmChair"]

struct Furniture_DetailView : View{
    
    @Binding var item : Furniture_Model
    @Binding var show : Bool
    var animation : Namespace.ID
    
    var colors : [Color] = [.gray,.red,.blue]
    @State private var selectedColor : Color = .gray
    
    var body: some View {
        
        VStack {
            VStack {
                HStack {
                    
                    Button(action: {
                        withAnimation(.spring()) {
                            self.show.toggle()
                        }
                    }) {
                        HStack(spacing : 10) {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                            
                            Text("Back")
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                            
                            Image(systemName: "bag")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                            
                            Circle().fill(Color.gray)
                                .frame(width: 12, height: 12)
                                .offset(x: -5, y: -5)
                            
                        }
                    }
                }
                .padding()
                
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal,45)
                    .background(Color.white.clipShape(Circle()).padding(.top,50))
                    .matchedGeometryEffect(id: item.image, in: animation)
                    .padding(.top,25)
                
                HStack(spacing : 25) {
                    ForEach(colors, id : \.self) { color in
                        
                        Button(action: {selectedColor = color}) {
                            
                            ZStack {
                                Circle()
                                    .fill(color)
                                    .frame(width: 24, height: 24)
                                
                                Circle()
                                    .stroke(Color.black, lineWidth: 1)
                                    .frame(width: 32, height: 32)
                                    .opacity(selectedColor == color ? 1 : 0)
                            }
                            
                        }
                    }
                }
                .padding(.top,25)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(item.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(item.price)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top,8)
                    
                    
                }
                .padding()
                .padding(.horizontal,10)
                
            }
            .padding(.bottom,10)
            .background(Color.init(.systemGroupedBackground).clipShape(CustomCorner(corners: [.bottomLeft, .bottomRight], size: 45)).ignoresSafeArea(.all, edges: .top))
            
            Button(action: {}) {
                
                Text("Add to Cart")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 45)
                    .background(Color.gray)
                    .clipShape(Capsule())
                    .padding(.vertical)
            }
            
        }
        
        
    }
}
struct MenuButton : View {
    
    var title : String
    @Binding var selectedMenu : String
    
    var body: some View {
        Button(action: {selectedMenu = title}) {
            
            Text(title)
                .font(.system(size: 15))
                .fontWeight(selectedMenu == title ? .bold : .none)
                .foregroundColor(selectedMenu == title ? .white : Color.white.opacity(0.7))
                .padding(.vertical, 10)
                .padding(.horizontal,20)
                .background(Color(.systemGray3).opacity(selectedMenu == title ? 1 : 0))
                .cornerRadius(10)
            
        }
    }
}

struct Furniture_CardView : View {
    
    var item : Furniture_Model
    var animation : Namespace.ID
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            /// Z1
            
            HStack(spacing : 15) {
                Text(item.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 180)
                    .matchedGeometryEffect(id: item.image, in: animation)
                
            }
            .padding(.horizontal)
            .padding(.bottom)
            .background(Color.white.cornerRadius(25).padding(.top,35))
            .padding(.trailing,8)
            .background(Color.blue.cornerRadius(25).padding(.top,35))
            
            ///Z2
            Text(item.price)
                .foregroundColor(Color.black.opacity(0.6))
                .padding(.vertical,10)
                .padding(.horizontal, 35)
                .background(Color.orange)
                .clipShape(CustomCorner(corners: [.topRight,.bottomLeft], size: 15))
        }
    
    }
}

struct CustomCorner : Shape  {
    
    var corners : UIRectCorner
    var size : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: size, height: size))
        
        return Path(path.cgPath)
    }
}
