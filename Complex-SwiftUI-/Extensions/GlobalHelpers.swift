//
//  GlobalHelpers.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/03.
//

import Foundation

func creatExampleImageUrl(Int : Int) -> URL {
    
    let urlString = "https://picsum.photos/200/10\(Int)"
    
    return URL(string: urlString)!
}
