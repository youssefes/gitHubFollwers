//
//  NetworkManger.swift
//  gitHubFollwers
//
//  Created by youssef on 7/8/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class NetworkManger  {
    static let shared = NetworkManger()
    private let baseURL = "https://api.github.com/users/"
    let cache = NSCache <NSString  , UIImage>()
    private init() {}
    
    func getFollwers(for username : String, page : Int,complation : @escaping (Result<[Followers], GFError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            complation(.failure(.inValidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, Response, error) in
            if let _ = error{
                complation(.failure(.invalidData))
            }
            
            guard let respond = Response as? HTTPURLResponse , respond.statusCode == 200 else{
                complation(.failure(.invalRespond))
                return
            }
            
            guard let data = data else{
                complation(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
               let followers = try decoder.decode([Followers].self, from: data)
                complation(.success(followers))
                
            }catch{
                 complation(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    
    func getUserInfo(for username : String,complation : @escaping (Result<User, GFError>) -> Void) {
           let endpoint = baseURL + "\(username)"
           
           guard let url = URL(string: endpoint) else {
               complation(.failure(.inValidUsername))
               return
           }
           
           let task = URLSession.shared.dataTask(with: url) { (data, Response, error) in
               if let _ = error{
                   complation(.failure(.invalidData))
               }
               
               guard let respond = Response as? HTTPURLResponse , respond.statusCode == 200 else{
                   complation(.failure(.invalRespond))
                   return
               }
               
               guard let data = data else{
                   complation(.failure(.invalidData))
                   return
               }
               
               do{
                   let decoder = JSONDecoder()
                   decoder.keyDecodingStrategy = .convertFromSnakeCase
                  let userInfo = try decoder.decode(User.self, from: data)
                   complation(.success(userInfo))
                   
               }catch{
                    complation(.failure(.invalidData))
               }
           }
           
           task.resume()
       }
}
