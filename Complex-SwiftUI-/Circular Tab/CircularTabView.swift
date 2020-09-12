//
//  CircularTabView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/12.
//

import SwiftUI

struct CircularTabView: View {
    
    @State private var index = 0
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                switch index {
                case 0 :
                    
                    LinearGradient(gradient: .init(colors: [.green,.white]), startPoint: .top, endPoint: .bottom)
                    
                    VStack(spacing : 25) {
                        Text("Circular Tab")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                        
                        Text("Home - selectedIndex \(index)")
                            .font(.subheadline)
                    }
                    
                case 1 :
                    
                    LinearGradient(gradient: .init(colors: [.green,.white]), startPoint: .top, endPoint: .bottom)
                    
                    VStack(spacing : 25) {
                        Text("Circular Tab ")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                        
                        Text("Search - selectedIndex \(index)")
                            .font(.subheadline)
                    }
                    
                case 2 :
                    
                    LinearGradient(gradient: .init(colors: [.green,.white]), startPoint: .top, endPoint: .bottom)
                    
                    VStack(spacing : 25) {
                        Text("Circular Tab")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                        
                        Text("Like - selectedIndex \(index)")
                            .font(.subheadline)
                    }
                    
                case 3 :
                    
                    LinearGradient(gradient: .init(colors: [.green,.white]), startPoint: .top, endPoint: .bottom)
                    
                    VStack(spacing : 25) {
                        Text("Circular Tab")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                        
                        Text("Profile - selectedIndex \(index)")
                            .font(.subheadline)
                    }
                    
                    
                default :
                    Color.white
                    
                    Text("No Index")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                    
                }
            }
            
            //MARK: - Circular Tab
            CircularTab(index: $index)
            
            
        }
        
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct CircularTab : View {
    
    @Binding var index : Int
    
    var body: some View {
        
        HStack {
            
            VStack {
                
                Button(action: {
                    index = 0
                }) {
                    
                    if index != 0 {
                        Image(systemName: "house")
                            .font(.system(size: 22))
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: "house")
                            .frame(width: 25, height: 23)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom,30)
                        
                        Text("Home")
                            .foregroundColor(Color.black.opacity(0.8))
                        
                    }
                    
                    
                    
                }
                
               
                
            }
            
            Spacer(minLength: 15)
            
            VStack {
                
                Button(action: {
                    index = 1
                }) {
                    
                    if index != 1 {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 22))
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: "magnifyingglass")
                            .frame(width: 25, height: 23)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom,20)
                        
                        Text("Search")
                            .foregroundColor(Color.black.opacity(0.8))
                        
                    }
                    
                }
                
               
            }
            
            
            Spacer(minLength: 15)
            
            VStack {
                Button(action: {
                    index = 2
                }) {
                    
                    if index != 2 {
                        Image(systemName: "heart")
                            .font(.system(size: 22))
                            .foregroundColor(.gray)
                    } else {
                        
                        Image(systemName: "heart")
                            .frame(width: 25, height: 23)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom,20)
                        
                        Text("Likes")
                            .foregroundColor(Color.black.opacity(0.8))
                    }
                    
                }
                
        
                
            }
            
            
            
            Spacer(minLength: 15)
            
            VStack {
                Button(action: {
                    index = 3
                }) {
                    
                    if index != 3 {
                        Image(systemName: "person")
                            .font(.system(size: 22))
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: "person")
                            .frame(width: 25, height: 23)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom,20)
                        
                        Text("Profile")
                            .foregroundColor(Color.black.opacity(0.8))
                        
                    }
                    
                    
                }
                
                
                
            }
            
            
        }.padding(.vertical, -10)
        .padding(.horizontal,25)
        .background(Color(.systemGroupedBackground))
        .animation(.spring())
    }
}

struct CircularTabView_Previews: PreviewProvider {
    static var previews: some View {
        CircularTabView()
    }
}
