//
//  PaginationVIewModel.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/06.
//

import Foundation

class PaginationViewModel : ObservableObject {
    
    
    @Published var data = [Doc]()
    @Published var count : Int = 1
    
    init() {
        updateData()
    }
    
    func updateData() {
        
        guard let url = URL(string: "http:/api.plos.org/search%3Fq=title:%2522Food%2522&start=\(count)&rows=10") else {return}
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, res, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                return
            }
            
            do {
                
                let json = try JSONDecoder().decode(Detail.self, from: data!)
                
                let oldData = self.data
                
                DispatchQueue.main.async {
                    self.data = oldData + json.response.docs
                    self.count +=  10
                }
               
            }
            catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
}

struct Detail : Codable{
    let response : Response
}

struct Response : Codable {
 
    let docs: [Doc]
}

// MARK: - Doc
struct Doc: Codable {
    let id, journal, eissn: String
    let publicationDate: String
    let articleType: String
 

    enum CodingKeys: String, CodingKey {
        case id, journal, eissn
        case publicationDate = "publication_date"
        case articleType = "article_type"
      
    }
}


