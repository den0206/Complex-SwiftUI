//
//  SideMenu.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/05.
//

import SwiftUI

struct SideMenu: View {
    
    @State  var edge = UIApplication.shared.windows.first?.safeAreaInsets
    @State private var width = UIScreen.main.bounds.width
    @State private var show = false
    @State private var selectedIndex = ""
    
    var body: some View {
        
        ZStack {
            VStack {
                ZStack {
                    
                    /// navigation header
                    HStack {
                        Button(action: {}, label: {
                            
                            Image(systemName: "line.horizontal.3")
                                .font(.system(size: 22))
                                .foregroundColor(.gray)
                        })
                        
                        
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                show.toggle()
                            }
                        }, label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 22))
                                .foregroundColor(.gray)
                        })
       
                        
                    }
                    
                    Text("Home")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding()
                .padding(.top, 3)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                Spacer(minLength: 0)
                
                Text(selectedIndex)
                
                Spacer(minLength: 0)
                
            }
            
            /// side Menu
            HStack( spacing: 20) {
                Spacer(minLength: 0)
                
                VStack {
                    
                    /// close Button
                    HStack {
                        
                        Spacer(minLength: 0)
                        
                        Button {
                            withAnimation(.spring()) {
                                show.toggle()
                            }
                        } label: {
                            
                            Image(systemName: "xmark")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                        }
                        
                    }
                    .padding()
                    .padding(.top,4)
                    
                    HStack(spacing : 15) {
                        Image(systemName: "person.fill")
                            .frame(width: 75, height: 75)
                            .foregroundColor(.gray)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("name")
                                .font(.title)
                                .fontWeight(.semibold)
                            
                            Text("@gmail.com")
                                
                        }
                        .foregroundColor(.white)
                        
                    }
                    .padding(.horizontal)
                    
                    /// menu Buttons
                    
                    VStack(alignment: .leading) {
                        
                        MenuButtons(image: "cart", title: "My Orders",selected: $selectedIndex, show: $show)
                        
                        MenuButtons(image: "person", title: "Profile",selected: $selectedIndex, show: $show)
                        
                        MenuButtons(image: "mappin", title: "Deliverry",selected: $selectedIndex, show: $show)
                        
                        MenuButtons(image: "creditcard", title: "payment",selected: $selectedIndex, show: $show)
                        
                        MenuButtons(image: "envelope", title: "Contact",selected: $selectedIndex, show: $show)
                        
                        MenuButtons(image: "info.circle", title: "Info",selected: $selectedIndex, show: $show)
                        
                    }
                    .padding(.top)
                    .padding(.leading,40)
                   
                    
                    
                    
                    
                    Spacer(minLength: 0)
                }
                .frame(width: width - 100)
                .background(Color.orange)
                .offset(x: show ? 0 : width - 100)
            }
            .background(Color.black.opacity(show ? 0.3 : 0))
            
        }
        .ignoresSafeArea(.all, edges: .all)
        
     
       
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}

struct MenuButtons : View {
    
    var image : String
    var title : String
    @Binding var selected : String
    @Binding var show : Bool
    
    var body : some View {
        
        Button(action: {
            withAnimation(.spring()) {
                selected = title
                show.toggle()
            }
            
        }) {
            HStack(spacing : 15) {
                Image(systemName: image)
                    .font(.system(size: 22))
                    .frame(width: 25, height: 25)
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding(.vertical)
            .padding(.trailing)
        }
        .padding(.top,5)
        .foregroundColor(.white)
       
    }


}

struct CustomShape : Shape {
    
    func path(in rect : CGRect) -> Path {
    
        return Path { path in
            
            path.move(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 35, y: rect.height))
            path.addLine(to: CGPoint(x: 35, y: 0))
        }
    }
}
