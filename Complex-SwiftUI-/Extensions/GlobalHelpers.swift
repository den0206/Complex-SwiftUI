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

func creatExampleImageUrl(Int : Int) -> URL {
    
    let urlString = "https://picsum.photos/200/10\(Int)"
    
    return URL(string: urlString)!
}

func getPeopleImageUrl() -> URL {
    let iValue = Int.random(in: 1 ... 99)
    let urlString : String = "https://source.unsplash.com/random/450×450/?people\(iValue)"

    let encodeUrlString: String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    return URL(string: encodeUrlString)!
}


