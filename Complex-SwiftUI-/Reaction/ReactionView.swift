//
//  ReactionView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/10/14.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReactionView: View {
    
    @State private var posts = [ReactionPost(image: getExampleImageUrl(), title: "aa", time: "PM6", liked: false, reaction: ""),
                                 ReactionPost(image: getExampleImageUrl(), title: "bb", time: "PMt", liked: false, reaction: ""),
    ]
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing : 12) {
                ForEach(posts) { post in
                    ReactionPostView(post: post)
                        .background(Color.white)
                }
            }
            
        }
        .padding(.vertical)
    }
}

struct ReactionPostView : View {
    
    @State var post : ReactionPost
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            
            ///z1
            VStack {
                HStack(spacing : 15) {
                    
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Name")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Text(post.time)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer(minLength: 0)
                    
                }
                .padding()
                
                HStack {
                    Text(post.title)
                        .foregroundColor(.black)
                    Spacer(minLength: 0)
                }
                .padding(.horizontal)
                
                WebImage(url: post.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width, height: 250)
                
                ZStack {
                    HStack {
                        HStack(spacing : 10) {
                            if post.reaction == "" {
                                Image(systemName: "hand.thumbsup")
                                    .font(.system(size: 22,weight : .heavy))
                                    .foregroundColor(post.liked ? Color.red : Color.gray)
                            }
                            
                            Text(post.reaction == "" ? (post.liked ? "Liked" : "Like") : "")
                                .fontWeight(.heavy)
                                .foregroundColor(post.liked ? Color.red : .gray)
                            
                            AnimatedImage(name: post.reaction)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                            
                            
                        }
                        .onTapGesture {
                            post.liked.toggle()
                        }
                        .gesture(DragGesture(minimumDistance: 0).onChanged(onChanged(value:)).onEnded(onEnded(value:)))
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {}, label: {
                            
                            Label(
                                title: {
                                    Text("Share")
                                        .fontWeight(.heavy)
                                        .foregroundColor(.gray)
                                },
                                icon: {
                                    Image(systemName: "square.and.arrow.up")
                                        .font(.system(size: 22, weight: .heavy))
                                        .foregroundColor(.gray)
                                })
                        })
                    }
                    
                    Button(action: {}) {
                        Label(
                            title: {
                                Text("Comment")
                                    .fontWeight(.heavy)
                                    .foregroundColor(.gray)
                            },
                            icon: {
                                Image(systemName: "message")
                                    .font(.system(size: 22, weight: .heavy))
                                    .foregroundColor(.gray)
                            })
                    }
                    
                }
                .padding()
                
            }
            .zIndex(0)
            
            /// Z2

            if post.show {
                ReactionPopView(post: $post)
                    .offset(y: -80)
                    .padding(.leading)
                    .zIndex(1)
            }
        }
    }
    
    //MARK: - Drag Gesture
    
    func onChanged(value : DragGesture.Value) {
        withAnimation(.easeIn) {post.show = true}
        
        withAnimation(Animation.linear(duration: 0.15)) {
            
            let x = value.location.x
            
            if x > 20 && x < 80{post.reaction = reactions[0]}
            if x > 80 && x < 140{post.reaction = reactions[1]}
            if x > 140 && x < 180{post.reaction = reactions[2]}
            if x > 180 && x < 240{post.reaction = reactions[3]}
            if x > 240 && x < 300{post.reaction = reactions[4]}
            if x > 300 && x < 360{post.reaction = reactions[5]}
            
            // if less or exceeds no Reaction..
            if x < 20 || x > 360{post.reaction = ""}
        }
    }
    
    func onEnded(value : DragGesture.Value) {
        withAnimation(Animation.linear.delay(0.2)) {
            post.show = false
        }
    }
    
}

struct ReactionPopView : View {
    
    @Binding var post : ReactionPost
    
    var body: some View {
        
        HStack(spacing : 15) {
            ForEach(reactions, id : \.self) { gif in
                
                AnimatedImage(name: gif)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: post.reaction == gif ? 100 : 40, height: post.reaction == gif ? 100 : 40)
                    .padding(post.reaction == gif ? -30 : 0)
                    .offset(y: post.reaction == gif ? -50 : 0)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal,20)
        .background(Color.white.clipShape(Capsule()))
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: 5)
    }
}

var reactions = ["like.gif","love.gif","haha.gif","wow.gif","sad.gif","angry.gif"]

struct ReactionPost : Identifiable {
    
    var id = UUID().uuidString
    var image : URL
    var title : String
    var time : String
    var liked : Bool
    var reaction : String
    var show = false
}
