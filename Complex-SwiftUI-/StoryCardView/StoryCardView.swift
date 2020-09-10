//
//  StoryCardView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/10.
//

import SwiftUI
import SDWebImageSwiftUI

struct StoryCardView: View {
    
    //MARK: - Property
    
    @State private var index = 0
    @State private var stories = exampleStories
    
    @State private var scrolled = 0
    @State private var index1 = 0
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                
                HStack {
                    
                    Button(action: {}) {
                        Image(systemName: "list.bullet")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                        
                    }
                    
                }
                .padding()
                
                HStack {
                    
                    Text("Trend")
                        .font(.system(size: 40,weight : .bold))
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        Image(systemName: "square.grid.3x2")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                    }
                    
                }
                .padding(.horizontal)
                
                HStack {
                    
                    Text("Animated")
                        .font(.system(size: 15))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.vertical,6)
                        .padding(.horizontal, 20)
                        .background(Color.pink.opacity(index == 0 ? 1 :0))
                        .clipShape(Capsule())
                    
                    Text("+ Stories")
                        .font(.system(size: 15))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.vertical,6)
                        .padding(.horizontal, 20)
                        .background(Color.blue.opacity(index == 0 ? 1 :0))
                        .clipShape(Capsule())
                    
                    
                    Spacer()
                    
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            //MARK: - Card Views
            
            ZStack {
                
                ForEach(stories.reversed()) { story in
                    
                    /// one card
                    HStack {
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                            
                            
                            WebImage(url: story.imageUrl)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: caluculateWidth(), height: (UIScreen.main.bounds.height / 1.8) - CGFloat(story.id - scrolled * 50))
                                .cornerRadius(15)
                            
                            VStack(alignment: .leading , spacing: 18) {
                                
                                HStack {
                                    Text(story.title)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                                
                                Button(action: {}) {
                                    Text("Read")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 25)
                                        .background(Color.pink)
                                        .clipShape(Capsule())
                                }
                            }
                            .frame(width: caluculateWidth() - 40)
                            .padding(.leading, 20)
                            .padding(.bottom, 20)
                            
                          
                        }
                        .offset(x: story.id - scrolled <= 2 ? CGFloat(story.id - scrolled) * 30 : 60)
                        Spacer(minLength: 0)
                    }
                    .contentShape(Rectangle())
                    .offset(x: story.offset)
                    .gesture(DragGesture().onChanged({ (value) in
                        withAnimation {
                            
                            if value.translation.width < 0 && story.id != stories.last!.id {
                                stories[story.id].offset = value.translation.width
                            } else {
                                if story.id > 0 {
                                    stories[story.id - 1].offset = -(caluculateWidth() + 60) + value.translation.width
                                }
                            }
                        }
                    }).onEnded({ (value) in
                        withAnimation {
                            if value.translation.width < 0 {
                                if -value.translation.width > 180 && story.id != stories.last!.id {
                                    stories[story.id].offset = -(caluculateWidth() + 60)
                                    scrolled += 1
                                } else {
                                    stories[story.id].offset = 0
                                }
                            } else {
                                if story.id > 0 {
                                    if value.translation.width > 180 {
                                        stories[story.id - 1].offset = 0
                                        scrolled -= 1
                                    } else {
                                        stories[story.id - 1].offset = -(caluculateWidth() + 60)
                                    }
                                }
                            }
                        }
                    })
                    )
                    
                }
            }
            .frame(height: UIScreen.main.bounds.height / 1.8)
            .padding(.horizontal, 25)
            .padding(.top, 25)

            HStack {
                Text("Favorite")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)

                Spacer(minLength: 0)

                Button(action: {}) {
                    Image(systemName: "square.grid.3x2")
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                }

            }
            .padding(.horizontal)
            .padding(.top, 25)

            HStack {
                Text("Latest")
                    .font(.system(size: 15))
                    .foregroundColor(index1 == 0 ? .white : Color.pink.opacity(0.85))
                    .fontWeight(.bold)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 20)
                    .background(Color.pink.opacity(index1 == 0 ? 1 :0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        index1 = 0
                    }

                Text("+ Stories")
                    .font(.system(size: 15))
                    .foregroundColor(index1 == 0 ? .white : Color.blue.opacity(0.85))
                    .fontWeight(.bold)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 20)
                    .background(Color.blue.opacity(index1 == 0 ? 1 :0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        index1 = 1
                    }

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top,10)

            HStack {

                WebImage(url: stories[0].imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 80, height: 250)
                    .cornerRadius(15)

                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            .padding(.top, 20)
            .padding(.bottom)

            
        }
        .background(LinearGradient(gradient: .init(colors: [Color.black, Color.purple]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
    
    //MARK: - function
    
    func caluculateWidth() -> CGFloat {
        let screen = UIScreen.main.bounds.width - 50
        let width = screen - (2 * 30)
        return width
    }
}

struct StoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCardView()
    }
}
