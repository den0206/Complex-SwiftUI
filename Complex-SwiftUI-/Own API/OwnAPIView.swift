//
//  OwnAPIView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/07.
//

import WebKit
import SwiftUI
import SDWebImageSwiftUI


struct OwnAPIView: View {
    
    @ObservedObject var vm = OwnAPIViewModel()
    @State private var items = Array(repeating: GridItem(spacing : 15), count: 2)
    @State private var link = ""
    @State private var show = false
    
    var body: some View {
        
        
        NavigationView {
            VStack {
                if !vm.cards.isEmpty {
                    ScrollView {
                        
                        LazyVGrid(columns: items, spacing: 15) {
                            ForEach(vm.cards, id : \.titleName) { card in
                                
                                OwnCardView(card: card, items: $items)
                                    .onTapGesture {
                                        link = card.link
                                        show.toggle()
                                    }
                            }
                        }
                    }
                } else {
                    ProgressView()
                }
            }
            .preferredColorScheme(.dark)
            .navigationBarTitle("Tutorials")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        
                        withAnimation{
                            if items.count == 2 {items.removeLast()}
                            else{items.append(GridItem(spacing : 15))}
                        }
                        
                    }) {
                        Image(systemName: items.count == 2 ? "square.grid.2x2" : "rectangle.grid.1x2.fill")
                    }
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                    
                }
            }
            .sheet(isPresented: $show) {
                WebView(url: $link)
            }
        }
        
    }
}

struct OwnCardView : View {
    
    var card : OwnModel
    @Binding var items : [GridItem]
    
    var body: some View {
        
        VStack(spacing : 15) {
            WebImage(url: URL(string: card.imageLink))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack(spacing : 0) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(card.titleName)
                        .fontWeight(.bold)
                        .lineLimit(1)
                    
                    Text(card.detail)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .lineLimit(3)
                }
                
                Spacer(minLength: 0)
            }
        }
        .frame(height: items.count == 2 ? (UIScreen.main.bounds.height - 50) / 2.5 : nil)
        .padding()
        .background(Color.primary.opacity(0.05))
        .cornerRadius(10)
    }
}

//MARK: - Web View

struct WebView : UIViewRepresentable {
    
    @Binding var url : String
    
    func makeUIView(context: Context) -> some UIView {
        let view = WKWebView()
        view.load(URLRequest(url: URL(string: url)!))
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct OwnAPIView_Previews: PreviewProvider {
    static var previews: some View {
        OwnAPIView()
    }
}
