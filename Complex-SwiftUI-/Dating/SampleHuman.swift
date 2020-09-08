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
    SampleHuman(id: 0, name: "a", imageUrl: getPeopleImageUrl(), age: "22", offSet: 0),
    SampleHuman(id: 1, name: "b", imageUrl: getPeopleImageUrl(), age: "24", offSet: 0),
    SampleHuman(id: 2, name: "c", imageUrl: getPeopleImageUrl(), age: "32", offSet: 0),
    SampleHuman(id: 3, name: "d", imageUrl: getPeopleImageUrl(), age: "45", offSet: 0),
    SampleHuman(id: 4, name: "e", imageUrl: getPeopleImageUrl(), age: "65", offSet: 0),
    SampleHuman(id: 5, name: "f", imageUrl: getPeopleImageUrl(), age: "23", offSet: 0),
    SampleHuman(id: 6, name: "g", imageUrl: getPeopleImageUrl(), age: "19", offSet: 0),

]
