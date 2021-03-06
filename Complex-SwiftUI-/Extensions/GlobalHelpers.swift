//
//  GlobalHelpers.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/03.
//

import Foundation
import SwiftUI

func hideKeyBord() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}

func creatExampleImageUrl() -> URL {
    
    let iValue = Int.random(in: 1 ... 99)
    let urlString = "https://picsum.photos/200/10\(iValue)"
    
    return URL(string: urlString)!
}

func getExampleImageUrl(_ word : String = "people") -> URL {
    let iValue = Int.random(in: 1 ... 99)
    let urlString : String = "https://source.unsplash.com/random/450×450/?\(word)\(iValue)"

    let encodeUrlString: String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    return URL(string: encodeUrlString)!
}


extension Color {
    
    static var random : Color{
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}

