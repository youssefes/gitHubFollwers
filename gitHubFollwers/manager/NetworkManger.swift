//
//  NetworkManger.swift
//  gitHubFollwers
//
//  Created by youssef on 7/8/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation

class NetworkManger  {
    static let shared = NetworkManger()
    let baseURL = "https://api.github.com"
    private init() {}
    
    func getFollwers(for username : String, page : Int,complation : @escaping ([Followers]? , ErrorMassages?) -> Void) {
        let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            complation(nil, .inValidUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, Response, error) in
            if let _ = error{
                complation(nil, .unableToComplet)
            }
            
            guard let respond = Response as? HTTPURLResponse , respond.statusCode == 200 else{
                complation(nil, .invalRespond)
                return
            }
            
            guard let data = data else{
                complation(nil, .invalidData)
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
               let followers = try decoder.decode([Followers].self, from: data)
                complation(followers,nil)
                
            }catch{
                complation(nil, .invalidData)
            }
        }
        
        task.resume()
    }
}
