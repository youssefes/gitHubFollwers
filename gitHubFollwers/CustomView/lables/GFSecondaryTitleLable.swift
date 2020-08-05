//
//  GFSecondaryTitleLable.swift
//  gitHubFollwers
//
//  Created by youssef on 7/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class GFSecondaryTitleLable: UILabel {

    override init(frame: CGRect) {
           super.init(frame : frame)
           configration()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
     
     init(fonSize : CGFloat) {
         super.init(frame: .zero)
         self.font = UIFont.systemFont(ofSize: fonSize, weight: .medium)
         configration()
     }

     func configration(){
         textColor = .secondaryLabel
         adjustsFontSizeToFitWidth = true
         minimumScaleFactor = 0.90
         lineBreakMode = .byTruncatingTail
         translatesAutoresizingMaskIntoConstraints = false
     }

}
