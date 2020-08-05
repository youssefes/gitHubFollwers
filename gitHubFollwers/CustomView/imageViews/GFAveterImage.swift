//
//  GFAveterImage.swift
//  gitHubFollwers
//
//  Created by youssef on 7/9/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class GFAveterImage: UIImageView {

    let cache = NetworkManger.shared.cache
    
    let placeHolderImage = UIImage(named: "avatar-placeholder")
   override init(frame: CGRect) {
          super.init(frame : frame)
          configration()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }

    
    private func configration(){
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from URlString : String)   {
        
        let cacheKey = NSString(string: URlString)
        if let image = cache.object(forKey: cacheKey){
            self.image = image
            return
        }
        guard let url = URL(string: URlString) else{return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, respond, error in
            guard let self = self else{return}
            if error != nil{
                return
            }
            guard let respond = respond as? HTTPURLResponse , respond.statusCode == 200 else{return}
            guard let data = data else {return}
            guard let image = UIImage(data: data) else{return }
            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
    
}
