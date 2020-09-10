//
//  Story.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/10.
//

import Foundation
import SwiftUI

struct Story : Identifiable {
    var id : Int
    var imageUrl : URL
    var offset : CGFloat
    var title : String
}

var exampleStories = [
    Story(id: 1, imageUrl: creatExampleImageUrl(), offset: 0, title: "1 Story"),
    Story(id: 2, imageUrl: creatExampleImageUrl(), offset: 0, title: "2 Story"),
    Story(id: 3, imageUrl: creatExampleImageUrl(), offset: 0, title: "3 Story"),
    Story(id: 4, imageUrl: creatExampleImageUrl(), offset: 0, title: "14Story"),
    
]
