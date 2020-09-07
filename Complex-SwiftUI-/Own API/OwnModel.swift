//
//  APIModel.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/07.
//

import Foundation


struct OwnModel :  Codable {
    
    var titleName : String
    var detail : String
    var imageLink : String
    var link : String
}

class OwnAPIViewModel : ObservableObject {
    
    @Published var cards = [OwnModel]()
    
    init() {
        getVideos()
    }
    
    func getVideos() {
        
        guard let url = URL(string: "https://kavsoft.dev/api/v1/videos") else {return}
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("swiftui2.0", forHTTPHeaderField: "field")
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { (data, res, error) in
            
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            let response = res as! HTTPURLResponse
            
            if response.statusCode == 404 {
                print("404 error")
            }
            
            do {
                let jsonData = try JSONDecoder().decode([OwnModel].self, from: data!)
                
                DispatchQueue.main.async {
                    self.cards = jsonData
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
