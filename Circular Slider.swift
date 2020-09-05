//
//  Circular Slider.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/05.
//

import SwiftUI

struct Circular_Slider: View {
    
    @State private var size = UIScreen.main.bounds.width - 100
    @State private var progress : CGFloat = 0
    @State private var angle : Double = 0
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                ZStack {
                    /// base Circle
                    Circle().stroke(Color.gray, style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                        .frame(width: size, height: size)
                    
               
                    
                    /// Progress CIrcle
                    Circle()
                        .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to:progress)
                        .stroke(Color.green, style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                        .frame(width: size, height: size)
                        .rotationEffect(.init(degrees: -90))
                    
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 55, height: 155)
                        .offset(x: size / 2)
                        .rotationEffect(.init(degrees: -90))
                    
                    /// drag Circle
                    Circle()
                        .fill(Color.white)
                        .frame(width: 55, height: 155)
                        .offset(x: size / 2)
                        .rotationEffect(.init(degrees: angle))
                        .gesture(DragGesture().onChanged(onDrag(value:)))
                        .rotationEffect(.init(degrees: -90))
                    
                    /// cente Text
                    
                    Text( String(format: "%.0f", progress * 100) + "%")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                }
            }
            .preferredColorScheme(.dark)
            .navigationTitle("Percentage Circle")
        }
        
      
    }
    
    //MARK: - Actions
    
    func onDrag(value : DragGesture.Value) {
        
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        let radius = atan2(vector.dy - 27.5, vector.dx - 27.5)
        
        var angle = radius * 180 / .pi
        
        if angle < 0 {
            angle = 360 + angle
        }
        
        withAnimation(Animation.linear(duration: 0.15)) {
            let progress = angle / 360
            self.progress = progress
            self.angle = Double(angle)
        }
        
    }
}

struct Circular_Slider_Previews: PreviewProvider {
    static var previews: some View {
        Circular_Slider()
    }
}
