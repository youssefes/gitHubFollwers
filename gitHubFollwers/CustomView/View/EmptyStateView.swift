//
//  EmptyStateView.swift
//  gitHubFollwers
//
//  Created by youssef on 7/12/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class EmptyStateView: UIView {
    
    
    let massageLbl = GHtitleLable(Alighnment: .center, fonSize: 28)
    let imageLogo = UIImageView()
    override init(frame: CGRect) {
        super.init(frame : frame)
        configration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(massage : String) {
        super.init(frame :.zero)
        massageLbl.text = massage
        configration()
    }
    
    func configration() {
        addSubview(imageLogo)
        addSubview(massageLbl)
        
        massageLbl.numberOfLines = 3
        massageLbl.textColor = .secondaryLabel
        
        imageLogo.image = UIImage(named: "empty-state-logo")
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                
            imageLogo.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            imageLogo.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            imageLogo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            imageLogo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40),
            
            massageLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -140),
            massageLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            massageLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            massageLbl.heightAnchor.constraint(equalToConstant: 200)
            
            
            
        
        ])
    }
    
}
