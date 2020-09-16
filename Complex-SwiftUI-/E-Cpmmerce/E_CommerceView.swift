//
//  E-CommerceView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/16.
//

import SwiftUI

struct E_CommerceView: View {
    
    @State private var colorIndex = 0
    
    var body: some View {
        
        VStack {
            /// Main Pic View
            VStack {
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color(.brown))
                        .font(.system(size: 24))
                        .padding(.trailing)
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "suit.heart.fill")
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background(Color.red)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                    
                }
                .padding([.top, .horizontal])
                
                HStack(spacing : 15) {
                    
                    VStack {
                        
                        Group {
                            Text("Brand")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            
                            Text("Moon")
                            
                            Text("Code")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .padding(.top,10)
                            
                            Text("Y24869")
                            
                            Text("Cotton")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .padding(.top,10)
                            
                            Text("100 %")
                            
                            Text("Color")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .padding(.top,10)
                        }
                        .foregroundColor(Color.gray)
                        
                        
                        HStack(spacing : 12) {
                            
                            Button(action: {
                                colorIndex = 0
                            }) {
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width: colorIndex == 0 ? 30 : 20, height: colorIndex == 0 ? 30 : 20)
                            }
                            
                            Button(action: {
                                colorIndex = 1
                            }) {
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: colorIndex == 1 ? 30 : 20, height: colorIndex == 1 ? 30 : 20)
                            }
                            
                            Button(action: {
                                colorIndex = 2
                            }) {
                                Circle()
                                    .fill(Color.orange)
                                    .frame(width: colorIndex == 2 ? 30 : 20, height: colorIndex == 2 ? 30 : 20)
                            }
                            
                        }
                        .padding(.top,10)
                        
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    Image(colorIndex == 0 ? "pic1" : (colorIndex == 1 ?  "pic2" : "pic3"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.leading, 10)
                    
                }
                .padding()
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom,25)
            .background(Color(.black))
            .clipShape(E_CommerceShape())
            
            if UIScreen.main.bounds.height < 750 {
                
                ScrollView {
                    SizeView()
                }
            } else {
                SizeView()
            }
     
            
        }
        
   
    }
}

struct SizeView : View {
    
    
    @State private var  selectedSize = "S"
    @State private var count = 1
    
    var body: some View {
        
        HStack(spacing : 20) {
            Text("T-Shirt")
                .font(.system(size: 25))
                .foregroundColor(.black)
            
            Spacer(minLength: 0)
            
            Text("$ 900")
                .foregroundColor(.red)
                .font(.system(size: 20))
                .overlay(
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 2)
                )
            
            Text("$ 700")
                .foregroundColor(Color.black)
                .fontWeight(.bold)
                .font(.system(size: 20))
            
        }
        .padding(.horizontal)
        
        VStack(alignment: .leading, spacing: 12) {
            Text("Size")
                .fontWeight(.bold)
            
            HStack(spacing : 15) {
                
                ForEach(sizes, id : \.self) { size in
                    
                    Button(action: {
                        selectedSize = size
                    }) {
                        Text(size)
                            .font(UIScreen.main.bounds.height < 750 ? Font.caption : Font.body)
                            .foregroundColor(selectedSize == size ? .white : .black)
                            .padding(.vertical , 8)
                            .padding(.horizontal , 10)
                            .background(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.red.opacity(selectedSize == size ? 1 :0))
                                        
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.red, lineWidth: 1)
                                        
                                }
                            )
                    }
                }
            }
            
            Text("About")
                .fontWeight(.bold)
                .padding(.top, 10)
            
            Text("Example Description")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
        
        }
        .padding(.horizontal)
        
        HStack(spacing : 15) {
            
            Button(action: {
                count += 1
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 22))
                    .foregroundColor(Color.red)
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            
            Text("Count")
            
            Button(action: {
                if count > 1 {
                    count -= 1
                }
                
            }) {
                Image(systemName: "minus")
                    .font(.system(size: 22))
                    .foregroundColor(Color.red)
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
            }
            
            Button(action: {print("Add to Cart")}) {
                 Text("Add To Cart")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, UIScreen.main.bounds.height < 750 ? 20 : 20)
                    .background(Color.red)
                    .clipShape(Capsule())
                
            }
    
        }
        .padding(.top, 10)
        
        
        
        
    }
}

var sizes = ["S","M","L","X","XX","XL","XXL"]

struct E_CommerceShape : Shape  {
    
    
    func path(in rect: CGRect) -> Path {
        let rect = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, . bottomRight], cornerRadii: CGSize(width: UIScreen.main.bounds.width < 750 ? 30 : 45, height: UIScreen.main.bounds.width < 750 ? 30 : 45) )
        
        return Path(rect.cgPath)
    }
}

struct E_CommerceView_Previews: PreviewProvider {
    static var previews: some View {
        E_CommerceView()
    }
}
