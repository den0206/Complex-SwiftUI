//
//  SearchView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/04.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var isSearching = false
    
    var body: some View {

        NavigationView {
            
            ScrollView {
                
                SearchField(searchText: $searchText, isSearching: $isSearching)
                
                /// List
                
                ForEach((0..<20).filter({"\($0)".contains(searchText) || searchText.isEmpty}), id: \.self) { num in
                    
                    HStack {
                        Text("\(num)")
                        Spacer()
                        
                    }
                    .padding()
                    
                    Divider()
                        .foregroundColor(.black)
                        .padding(.leading)
                }
            }
            
            .navigationTitle("Food")
        }
       
    }
    
    //MARK: - Action
    
 
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SearchField: View {
    
    @Binding var searchText : String
    @Binding var isSearching : Bool
    
    var body: some View {
        HStack {
            /// search field
            HStack {
                TextField("Search", text: $searchText)
                    .padding(.leading,24)
                    .onTapGesture(perform: {
                        self.isSearching = true
                    })
            }
            .padding()
            .background(Color(.systemGray3))
            .cornerRadius(12)
            .padding(.horizontal)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if isSearching {
                        Button(action: {
                            self.searchText = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })
                    }
                    
                    
                }
                .padding(.horizontal,32)
                .foregroundColor(.gray)
                
            )
            .transition(.move(edge: .trailing))
            .animation(.spring())
            
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    
                    hideKeyBord()
                }, label: {
                    Text("Cancel")
                })
                .padding(.trailing,24)
                .padding(.leading,0)
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
            
        }
    }
}


