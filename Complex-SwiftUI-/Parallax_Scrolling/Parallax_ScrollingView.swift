//
//  Parallax_ScrollingView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/11/01.
//

import SwiftUI
import SDWebImageSwiftUI



struct Parallax_ScrollingView: View {
    
    @State private var current_Index : Int = 0
    @State private var currentDrag : CGFloat = 0
    var objectWidth = UIScreen.main.bounds.width - 90
    var objecgPadding : CGFloat = 10
    var parallelMargintude : CGFloat = 80
    
    private var things = [Thing(title: "1"),
                  Thing(title: "2"),
                  Thing(title: "3"),
                  Thing(title: "4"),
                  Thing(title: "5"),
    ]

    
    
    
    var body: some View {
        ZStack {
            ForEach(0 ..< self.things.count) { i in
                
                ZStack {
//                    WebImage(url: getExampleImageUrl())
                    Image("\(i)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: self.objectWidth + (2 * parallelMargintude), height: 500)
                        .overlay(Color.black.opacity(self.isCurrentIndex(i: i) ? 0 : 0.3))
                        .offset(x: (CGFloat(i - self.current_Index) * (self.parallelMargintude)) + ((self.currentDrag / ((self.objectWidth + self.objecgPadding))) * self.parallelMargintude))
                        .animation(.easeIn(duration: 0.3))
           
                }
                .shadow(radius: 3)
                .frame(width: self.objectWidth, height: 500)
                .background(Color.gray)
                .cornerRadius(10)
                
                .offset(x: (CGFloat(i - self.current_Index) * (self.objectWidth + self.objecgPadding)) + self.currentDrag)
                .animation(.easeInOut(duration: 0.1))
                .gesture(DragGesture().onChanged({ (value) in
                    self.currentDrag = value.translation.width
                }).onEnded({ (value) in
                    if self.currentDrag > self.objectWidth / 2 {
                        if self.current_Index > 0 {
                            self.current_Index = self.current_Index - 1
                        }
                    } else if self.currentDrag < -self.objectWidth / 2 {
                        if self.current_Index < self.things.count - 1 {
                            self.current_Index = self.current_Index + 1
                        }
                    }
                    self.currentDrag = 0
                })
                )
                
            }
        }
    }
    
    func isCurrentIndex(i : Int) -> Bool {
        
        return current_Index == i
    }
}

struct Parallax_ScrollingView_Previews: PreviewProvider {
    static var previews: some View {
        Parallax_ScrollingView()
    }
}

struct Thing : Identifiable {
    var id = UUID()
    var title : String
}

