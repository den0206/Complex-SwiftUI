//
//  JSONData.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/06.
//

import Foundation

struct JSONData: Codable , Identifiable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let siteAdmin: Bool

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}

func getJSONData(urlString : String, comeletion :  @escaping([JSONData]) -> Void) {
    
    guard let url = URL(string: urlString) else {return}
    let session = URLSession(configuration: .default)
    
    session.dataTask(with: url) { (data, response, error) in
        if error != nil {
            print(error!.localizedDescription)
            return
        }
        
        do {
            let users = try JSONDecoder().decode([JSONData].self, from: data!)
            
            
            comeletion(users)
            
            
        } catch {
            print(error)
            
        }
        
        
    }.resume()
    
    
//    session.dataTask(with: url) { (data, response, error) in {
//

//
//
//    }
    
    
}
