//
//  Feeling Meter.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/06.
//

import SwiftUI

struct Feeling_Meter: View {
    
    @State private var progress : CGFloat = 0
    
    var body: some View {
        
        VStack {
           
            Meter(progress: $progress)
            
            /// buttons
            HStack(spacing : 25) {
                
                Button(action: {
                    withAnimation(Animation.default.speed(0.55)) {
                        
                        if self.progress != 100 {
                            self.progress += 10
                        }
                       
                    }
                }, label: {
                    Text("Increase")
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                })
                .background(Capsule().stroke(LinearGradient(gradient: .init(colors: [Color.gray, Color.black]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .trailing) ,lineWidth: 2))
                
                
                Button(action: {
                    self.progress = 0
                }, label: {
                    Text("Decrease")
                        .padding(.vertical,10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                })
                .background(Capsule().stroke(LinearGradient(gradient: .init(colors: [Color.gray, Color.black]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .trailing) ,lineWidth: 2))
            }
            
            
            
            Text("\(progress)")
                .fontWeight(.bold)
        }
    }
}

struct Feeling_Meter_Previews: PreviewProvider {
    static var previews: some View {
        Feeling_Meter()
    }
}


struct Meter : View {
    
    @Binding var progress : CGFloat
    
    var body: some View {
        
        
        ZStack {
            ZStack {
                /// base Circle
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(Color.black.opacity(0.1), lineWidth: 55)
                    .frame(width: 280, height: 280)
                
                Circle()
                    .trim(from: 0, to: setProgress())
                    .stroke(AngularGradient(gradient: .init(colors: [Color.gray, Color.black]), center: .center, angle: .init(degrees: 180)), lineWidth : 55)
                    .frame(width: 280, height: 280)
                
            }
            .rotationEffect(.init(degrees: 180))
            
            ZStack(alignment : .bottom) {
                
                Color.black
                    .frame(width: 2, height: 95)
                Circle()
                    .fill(Color.black)
                    .frame(width: 15, height: 15)
            }
            .offset( y: -35)
            .rotationEffect(.init(degrees: -90))
            .rotationEffect(.init(degrees: setArrow()))
        }
        .padding(.bottom,-140)
    }
    
    func setProgress() -> CGFloat{
        
        let temp = progress / 2
        
        return temp * 0.01
    }
    
    func setArrow() -> Double {
        let temp = progress / 100
        return Double(temp * 180)
    }
}
