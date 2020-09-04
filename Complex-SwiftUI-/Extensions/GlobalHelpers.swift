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
