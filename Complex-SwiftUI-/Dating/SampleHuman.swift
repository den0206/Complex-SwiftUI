//
//  SampleHuman.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/07.
//

import Foundation
import SwiftUI

struct SampleHuman : Identifiable {
    
    var id : Int
    var name : String
    var imageUrl : URL
    var age : String
    var offSet : CGFloat

}

var profiles = [
    SampleHuman(id: 0, name: "a", imageUrl: creatExampleImageUrl(Int: 1), age: "22", offSet: 0),
    SampleHuman(id: 1, name: "b", imageUrl: creatExampleImageUrl(Int: 2), age: "24", offSet: 0),
    SampleHuman(id: 2, name: "c", imageUrl: creatExampleImageUrl(Int: 3), age: "32", offSet: 0),
    SampleHuman(id: 3, name: "d", imageUrl: creatExampleImageUrl(Int: 4), age: "45", offSet: 0),
    SampleHuman(id: 4, name: "e", imageUrl: creatExampleImageUrl(Int: 5), age: "65", offSet: 0),
    SampleHuman(id: 5, name: "f", imageUrl: creatExampleImageUrl(Int: 6), age: "23", offSet: 0),
    SampleHuman(id: 6, name: "g", imageUrl: creatExampleImageUrl(Int: 7), age: "19", offSet: 0),

]
