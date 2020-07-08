//
//  GHtitleLable.swift
//  gitHubFollwers
//
//  Created by youssef on 7/8/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class GHtitleLable: UILabel {

   override init(frame: CGRect) {
          super.init(frame : frame)
          configration()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    init(Alighnment : NSTextAlignment, fonSize : CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = Alighnment
        self.font = UIFont.systemFont(ofSize: fonSize, weight: .bold)
        configration()
    }

    func configration(){
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
