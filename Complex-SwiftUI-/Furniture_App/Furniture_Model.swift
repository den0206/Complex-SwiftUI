//
//  Furniture_Model.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/23.
//

import Foundation


struct Furniture_Model : Identifiable {
    var id = UUID().uuidString
    var image : String
    var title : String
    var price : String
}

var furniture_Models = [
    Furniture_Model(image: "pic1", title: "Furniture1", price: "119$"),
    Furniture_Model(image: "pic2", title: "Furniture2", price: "79$"),
    Furniture_Model(image: "pic3", title: "Furniture3", price: "214$"),

]
