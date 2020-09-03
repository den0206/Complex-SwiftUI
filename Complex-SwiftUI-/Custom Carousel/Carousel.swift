//
//  Carousel.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/03.
//

import SwiftUI
import SDWebImageSwiftUI


struct Carousel: View {
    
    var cardWidth = UIScreen.main.bounds.width - (40 + 60)
    var cardHeight = UIScreen.main.bounds.height / 2
    
    @State private var books = [
        
        Book(id: 0, image: creatExampleImageUrl(Int: 1), title: "The Murder of Roger Ackroyd", author: "Agatha Christie", rating: 3, offset: 0),
        Book(id: 1, image: creatExampleImageUrl(Int: 2), title: "The Hound of the Baskervilles", author: "Arthur Conan", rating: 4, offset: 0),
        Book(id: 2, image: creatExampleImageUrl(Int: 3), title: "The Girl with the Dragon Tattoo", author: "Stieg Larsson", rating: 4, offset: 0),
        Book(id: 3, image: creatExampleImageUrl(Int: 4), title: "The Godfather", author: "Mario Puzo", rating: 5, offset: 0),
        Book(id: 4, image: creatExampleImageUrl(Int: 5), title: "The Lovely Bones", author: "Alice Sebold", rating: 4, offset: 0),
        Book(id: 5, image: creatExampleImageUrl(Int: 6), title: "Rebecca", author: "Daphne Du Maurier", rating: 4, offset: 0)
    ]

    
    var body: some View {
        
        VStack {
            HStack {
                Text("Custom Carousel")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer(minLength: 0)
                
                Button(action: {}, label: {
                    Image(systemName: "circle.grid.2x2.fill")
                        .font(.system(size: 22))
                })
                
            
            }
            .foregroundColor(.white)
            .padding()
            
            Spacer(minLength: 0)
            
            ZStack {
                
                ForEach(books.reversed()) { book  in
                    
                    HStack {
                        
                        ZStack {
                            
                            WebImage(url: book.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(.horizontal, 20)
                                .frame(width: cardWidth, height: getHeight(index: book.id))
                                .cornerRadius(25)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            
                            /// read More Button
                            CardView(card : book)
                                .frame(width: cardWidth, height: getHeight(index: book.id))
                            
                            
                        }
                        
                        Spacer(minLength: 0)
                    }
                    .contentShape(Rectangle())
                    .offset(x: book.id < 3 ?  CGFloat(book.id) * 30 : 60)
                    .offset(x: book.offset)
                    .gesture(DragGesture().onChanged({ (value) in
                        withAnimation{onScroll(value: value.translation.width, index: book.id)}
                    }).onEnded({ (value) in
                        withAnimation{onEnd(value: value.translation.width, index: book.id)}
                    }))
                    
                }
            }
            .frame(height: cardHeight)
            
            Spacer(minLength: 0)

        }
        .background(Color.black)
    }
    /// view
    
    //MARK: - Func
    
    func getHeight(index : Int) -> CGFloat {
        
        return cardHeight - (index < 3 ? CGFloat(index) * 40 : 80)
    }
    
    func onScroll(value : CGFloat, index : Int) {
        print(value)
        if value < 0 {
            /// left Swipe
            if index != books.last!.id {
                books[index].offset = value
            }
        }
    }
    func onEnd(value : CGFloat, index : Int) {
        
        if value < 0 {
            if -value > cardWidth / 2 && index != books.last!.id {
                books[index].offset = -(cardWidth * 60)
            }
        }
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel()
    }
}


struct  CardView : View {
    
    var card : Book
    
    var body: some View {
        
        VStack {
            
            Spacer(minLength: 0)
            
            HStack {
                Button {
                    return
                } label: {
                    Text("SHow Detail")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .background(Color("purple"))
                        .clipShape(Capsule())
                }

                
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.bottom, 10)
        }
    }
}
