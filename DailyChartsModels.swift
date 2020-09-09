//
//  DailyChartsModels.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/09.
//

import Foundation
import SwiftUI

struct Daily : Identifiable {
    
    var id : Int
    var day : String
    var workout_In_Min : CGFloat
}

var woukout_Data = [
    Daily(id: 0, day: "Day 1", workout_In_Min: 500),
    Daily(id: 1, day: "Day 2", workout_In_Min: 330),
    Daily(id: 2, day: "Day 2", workout_In_Min: 720),
    Daily(id: 3, day: "Day 3", workout_In_Min: 630),
    Daily(id: 4, day: "Day 4", workout_In_Min: 450),
    Daily(id: 5, day: "Day 5", workout_In_Min: 120),
    Daily(id: 6, day: "Day 6", workout_In_Min: 360),

]


struct  Stats : Identifiable {
    var id : Int
    var title : String
    var currentData : CGFloat
    var goal : CGFloat
    var color : Color = Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
}


var stats_Data = [
    Stats(id: 0, title: "Running", currentData: 6.8, goal: 15, color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))),
    Stats(id: 1, title: "Swiminng", currentData: 4.8, goal: 15, color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))),
    Stats(id: 2, title: "Energy", currentData: 5.5, goal: 45, color: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))),
    Stats(id: 3, title: "Sleep", currentData: 6.2, goal: 45, color: Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))),
    Stats(id: 4, title: "Cycling", currentData: 3.8, goal: 15, color: Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))),
    Stats(id: 5, title: "Steps", currentData: 6.4, goal: 15, color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))),
]



