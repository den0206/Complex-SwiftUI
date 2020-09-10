//
//  LazyVgridSearchView.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/10.
//

import SwiftUI

struct LazyVgridSearchView: View {
    
    @ObservedObject var vm = GridViewModel()
    
    private var columns = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 200),spacing: 12,alignment: .top), count: 3)
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns:columns,spacing : 12,content: {
                    ForEach(vm.items, id :\.self) { item in
                        
                        VStack(alignment: .leading) {
                            
                            Spacer()
                                .frame(width: 100, height: 100)
                                .background(Color.blue)
                            
                            Text(item.name)
                                .font(.system(size: 10, weight: .semibold))
                            Text(item.releaseDate)
                                .font(.system(size: 9, weight: .regular))
                            Text(item.copyright)
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        
                    }
                    
                })
                .padding(.horizontal,12)
            }
            .navigationTitle("Grid Search")
        }
        
       
    }
}

struct LazyVgridSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVgridSearchView()
    }
}

class GridViewModel : ObservableObject {
    
    @Published var items = [Result]()
    
    init() {
        
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/10/explicit.json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            do {
                let rss = try JSONDecoder().decode(RSS.self, from: data!)
                
                DispatchQueue.main.async {
                    self.items = rss.feed.results
                    
                }
                
            } catch {
                print(error)
            }
            
        }.resume()
    }
}


struct RSS : Decodable {
    let feed : Feed
}

struct Feed : Decodable {
    let results : [Result]
}

struct Result : Decodable, Hashable {
    let copyright,name,artworkUrl100,releaseDate : String
}
