//
//  GHBodyLible.swift
//  gitHubFollwers
//
//  Created by youssef on 7/8/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class GHBodyLible: UILabel {
    override init(frame: CGRect) {
        super.init(frame : frame)
        configration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(Alighnment : NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = Alighnment
        configration()
    }
    
    func configration(){
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
