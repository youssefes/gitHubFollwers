//
//  follwersCell.swift
//  gitHubFollwers
//
//  Created by youssef on 7/9/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class follwersCell: UICollectionViewCell {
    static let reuseID = "follwerCell"
    
    let aveterImage = GFAveterImage(frame: .zero)
    let usernameLbl = GHtitleLable(Alighnment: .center, fonSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        configration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(follower : Followers)  {
        usernameLbl.text = follower.login
        aveterImage.downloadImage(from: follower.avatarUrl)
    }
    private func configration(){
        
        let padding : CGFloat = 8
        addSubview(aveterImage)
        addSubview(usernameLbl)
        
        NSLayoutConstraint.activate([
             aveterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            aveterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            aveterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            aveterImage.heightAnchor.constraint(equalTo: aveterImage.widthAnchor),
            
            usernameLbl.topAnchor.constraint(equalTo: aveterImage.bottomAnchor, constant: 12),
            usernameLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLbl.heightAnchor.constraint(equalToConstant: 20)
        ])
       
    }
    
}
