//
//  DailyChartsView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/09.
//

import SwiftUI

struct DailyChartsView: View {
    
    @State private var selected = 0
    private var colums = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                
                HStack {
                    Text("Daily Charts")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button {
                        return
                    } label: {
                        Image(systemName: "list.bullet")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                    }

                }
                .padding()
                
                //MARK: - Charts View
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    Text("Daily Workout")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    HStack(spacing : 15) {
                        
                        ForEach(woukout_Data) { work in
                            
                            VStack {
                                
                                VStack {
                                    Spacer(minLength: 0)
                                    
                                    if selected == work.id {
                                        Text(getHrs(value: work.workout_In_Min))
                                            .foregroundColor(.white)
                                            .padding(.bottom , 5)
                                    }
                                    
                                    RoundedShape()
                                        .fill(LinearGradient(gradient: .init(colors: selected == work.id ? [Color.blue, Color.purple] :[Color.white.opacity(0.06)]), startPoint: .top, endPoint: .bottom))
                                        .frame( height: getHeight(value: work.workout_In_Min))
                                }
                                .frame(height: 200)
                                .onTapGesture {
                                    withAnimation {
                                        selected = work.id
                                    }
                                }
                                
                                Text(work.day)
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                            
                        }
                        
                    }
                }
                .padding()
                .background(Color.white.opacity(0.06))
                .cornerRadius(10)
                .padding()
                
                HStack {
                    Text("Statick")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                }
                
                //MARK: - Grid VIew
                
                LazyVGrid(columns: colums, spacing: 30) {
                    
                    ForEach(stats_Data) { stat in
                        
                        VStack(spacing : 32) {
                            
                            HStack {
                                Text(stat.title)
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Spacer(minLength: 0)
                            }
                            
                            /// Circle
                            ZStack {
                                
                                /// base circle
                                Circle()
                                    .trim(from: 0, to: 1)
                                    .stroke(stat.color.opacity(0.05), lineWidth: 10)
                                    .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.height - 150) / 2)
                                
                                
                                Circle()
                                    .trim(from: 0, to: stat.currentData / stat.goal)
                                    .stroke(stat.color, style : StrokeStyle(lineWidth: 10, lineCap: .round))
                                    .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.height - 150) / 2)
                                
                                /// center Text
                                
                                Text(getPercentage(current: stat.currentData, goal: stat.goal) + "%")
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .foregroundColor(stat.color)
                                    .rotationEffect(.init(degrees: 90))
                                
                            }
                            .rotationEffect(.init(degrees: -90))
                            
                            Text(getDec(val: stat.currentData) + "/" + getDec(val: stat.goal))
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.white.opacity(0.06))
                        .cornerRadius(15)
                        .shadow(color: Color.white.opacity(0.2), radius: 10, x: 0, y: 0)
                        
                        
                    }
                    
                }
                
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

extension DailyChartsView {
    
    private func getHrs(value : CGFloat) -> String {
        
        let hrs = value / 60
        return String(format: "%.1f", hrs)
    }
    
    private func getHeight(value : CGFloat) -> CGFloat {
        
        let hrs = CGFloat(value / 1440) * 200
        return hrs
    }
    
    private func getPercentage(current : CGFloat, goal : CGFloat) -> String {
        
        let per = (current / goal) * 100
        return String(format: "%.1f", per)
        
    }
    
    private func getDec(val : CGFloat) -> String {
        
        let format = NumberFormatter()
        format.numberStyle = .decimal
        
        return format.string(from: NSNumber.init(value: Float(val)))!
        
    }
}


struct  RoundedShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 5, height: 5))
        return Path(path.cgPath)
    }
}
struct DailyChartsView_Previews: PreviewProvider {
    static var previews: some View {
        DailyChartsView()
    }
}
