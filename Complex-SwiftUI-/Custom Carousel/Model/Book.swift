//
//  Book.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/03.
//

import Foundation
import SwiftUI

struct Book : Identifiable {
    
    var id: Int
    var image : URL
    var title : String
    var author : String
    var rating : Int
    var offset : CGFloat
}

//var books = [
//    
//    Book(id: 0, image: creatExampleImageUrl(Int: 1), title: "The Murder of Roger Ackroyd", author: "Agatha Christie", rating: 3, offset: 0),
//    Book(id: 1, image: creatExampleImageUrl(Int: 2), title: "The Hound of the Baskervilles", author: "Arthur Conan", rating: 4, offset: 0),
//    Book(id: 2, image: creatExampleImageUrl(Int: 3), title: "The Girl with the Dragon Tattoo", author: "Stieg Larsson", rating: 4, offset: 0),
//    Book(id: 3, image: creatExampleImageUrl(Int: 4), title: "The Godfather", author: "Mario Puzo", rating: 5, offset: 0),
//    Book(id: 4, image: creatExampleImageUrl(Int: 5), title: "The Lovely Bones", author: "Alice Sebold", rating: 4, offset: 0),
//    Book(id: 5, image: creatExampleImageUrl(Int: 6), title: "Rebecca", author: "Daphne Du Maurier", rating: 4, offset: 0)
//]


