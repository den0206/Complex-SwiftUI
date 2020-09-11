//
//  TravelView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/11.
//

import SwiftUI
import SDWebImageSwiftUI

struct TravelView: View {
    
    //MARK: -Proprty
    @State private var show = false
    @State private var selectedTravel = travelData[0]
    @State private var loadView = false
    
    @Namespace var namespace
    var columns = Array(repeating: GridItem(.flexible(),spacing: 15), count: 2)
    
    
    var body: some View {
        
        ZStack {
            //MARK: - Z1
            ScrollView (/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                
                HStack {
                    Text("Travel")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Tap")
                        
                    }, label: {
                        Image(systemName: "list.bullet")
                            .font(.system(size: 22))
                            .foregroundColor(.gray)
                    })
                }
                .padding([.horizontal,.top])
                
                LazyVGrid(columns: columns,spacing: 25, content:{
                   
                    ForEach(travelData) {travel in
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            WebImage(url: travel.image)
                                .resizable()
                                .frame(height : 180)
                                .cornerRadius(15)
                                .onTapGesture(perform: {
                                    withAnimation(.spring()) {
                                        
                                        show.toggle()
                                        selectedTravel = travel
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                            loadView.toggle()
                                        }
                                    }
                                    
                                })
                                .matchedGeometryEffect(id: travel.id, in: namespace)
                            
                            Text(travel.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        })
                        
                    }
                })
                .padding([.horizontal,.bottom])
            })
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            
            //MARK: - Z2
            
            if show {
                VStack {
                    
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                        
                        WebImage(url: selectedTravel.image)
                            .resizable()
                            .frame( height: 300)
                            .matchedGeometryEffect(id: selectedTravel.id, in: namespace)
                        
                        if loadView {
                            
                            HStack {
                                Button(action: {
                                    loadView.toggle()
                                    withAnimation {
                                        show.toggle()
                                    }
                                }, label: {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                        .padding()
                                })
                                
                                Spacer()
                                
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "suit.heart.fill")
                                        .foregroundColor(.red)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Circle())
                                })
                            }
                            .padding(.top,35)
                            .padding(.horizontal)
                        }
                            
                    })
                    
                    ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                       
                        if loadView {
                            VStack {
                                
                                HStack {
                                    Text(selectedTravel.title)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                
                                Text("Example Travel Spot Description ....")
                                    .multilineTextAlignment(.leading)
                                    .padding(.top)
                                    .padding(.horizontal)
                                
                                HStack(spacing : 0) {
                                    ForEach(1...5, id : \.self) { i in
                                        WebImage(url: getExampleImageUrl("landscape"))
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                            .offset(x: -CGFloat(i * 20))
                                    }
                                    
                                    Spacer(minLength: 0)
                                    
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Text("View All")
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    })
                                }
                                .padding(.leading,20)
                                .padding(.top)
                                .padding(.horizontal)
                                
                                
                                HStack {
                                    Text("Other Places")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                
                                TabView {
                                    ForEach(travelData) { travel in
                                        
                                        if travel.image != selectedTravel.image {
                                            WebImage(url: travel.image)
                                                .resizable()
                                                .cornerRadius(15)
                                                .padding(.horizontal)
                                        }
                                        
                                    }
                                }
                                .frame(height: 250)
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                .padding(.bottom)
                                
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Text("Book")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical)
                                        .frame(width: UIScreen.main.bounds.width - 150)
                                        .background(Color.blue)
                                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                                })
                                .padding(.top,25)
                                .padding(.bottom)
                                
                                
                                
                                
                            }
                        }
                    })
                }
                .background(Color(.systemGroupedBackground))
            }
            
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .statusBar(hidden: show ? true : false)
    }
}

struct TravelView_Previews: PreviewProvider {
    static var previews: some View {
        TravelView()
    }
}

//MARK: - Models

struct Travel : Identifiable {
    var id : Int
    var image : URL
    var title : String
}

var travelData = [

    Travel(id: 1, image: getExampleImageUrl("landscape"), title: "Travel Spot"),
    Travel(id: 2, image: getExampleImageUrl("landscape"), title: "Travel Spot"),
    Travel(id: 3, image: getExampleImageUrl("landscape"), title: "Travel Spot"),
    Travel(id: 4, image: getExampleImageUrl("landscape"), title: "Travel Spot"),
    Travel(id: 5, image: getExampleImageUrl("landscape"), title: "Travel Spot"),
    Travel(id: 6, image: getExampleImageUrl("landscape"), title: "Travel Spot"),


    
]
