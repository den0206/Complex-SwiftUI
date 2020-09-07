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
    
    let randomUrl = "https://source.unsplash.com/random/450×450/?people"
    return URL(string: randomUrl)!
}


func getUrl() {
    let urlString : String = "https://source.unsplash.com/random/450×450/?people"
//    guard let url = URL(string: "https://source.unsplash.com/random/450×450/?people") else {return}
    let encodeUrlString: String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    print(encodeUrlString)
   

}
