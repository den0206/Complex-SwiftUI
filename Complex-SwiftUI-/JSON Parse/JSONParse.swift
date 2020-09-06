//
//  JSONParse.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/06.
//

import SwiftUI
import SDWebImageSwiftUI

struct JSONParse: View {
    
    @State private var users = [JSONData]()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                if users.isEmpty {
                    
                    Spacer()
                    ProgressView()
                    Spacer()
                } else {
                    
                    
                    
                    List(users) { user in
                        
                        NavigationLink(
                            destination: DetailView(user: user),
                            label: {
                                //// custom Cell
                                
                                JSONCell(user: user)
                            })
                        
                        
                    }
                    .listStyle(InsetGroupedListStyle())
                }
                
            }
            /// refresh Button
            .navigationBarItems(trailing: Button(action: {
                users.removeAll()
                getJSONData(urlString: "https://api.github.com/users") { (users) in
                    self.users = users
                }
            }, label: {
              Image(systemName: "arrow.clockwise")
            }))
            .onAppear(perform: {
                getJSONData(urlString: "https://api.github.com/users") { (users) in
                    self.users = users
                }
            })
            .navigationTitle("Github Users")
            .navigationBarTitleDisplayMode(.inline)
        }
        

    }
}

struct DetailView : View {
    var user : JSONData
    @State private var followers = [JSONData]()
    @State private var isEmpty = false
    
    var body: some View {
        
        VStack {
            
            if followers.isEmpty {
                Spacer()
                
                if isEmpty {
                    Text("No Followers")
                } else {
                    ProgressView()
                }
           
                Spacer()
            } else {
                
                List(followers) { follower in
                    
                    //// custom Cell
                    JSONCell(user: follower)
                }
                .listStyle(InsetGroupedListStyle())
                
            }
            
        }
        .navigationTitle(user.login)
        .onAppear(perform: {
            getJSONData(urlString: user.followersURL) { (followers) in
                
                isEmpty = followers.count == 0
                
                self.followers = followers
            }
        })
    }
}

struct JSONCell : View {
    
    var user : JSONData
    
    var body: some View {
        
        HStack(spacing : 15) {
            
            AnimatedImage(url: URL(string: user.avatarURL))
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .shadow(radius: 5)
            
            Text(user.login)
                .fontWeight(.bold)
            
            
        }
        .padding(.vertical,15)
    }
}

struct JSONParse_Previews: PreviewProvider {
    static var previews: some View {
        JSONParse()
    }
}
