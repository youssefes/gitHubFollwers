//
//  GFTextField.swift
//  gitHubFollwers
//
//  Created by youssef on 7/7/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame : frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configration(){
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        translatesAutoresizingMaskIntoConstraints = false
        
        textColor = .label
        tintColor = .label
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        autocorrectionType = .no
        
        textAlignment = .center
        backgroundColor = .tertiarySystemBackground
        font = UIFont.preferredFont(forTextStyle: .title2)
        placeholder = "Enter a username"
    }
}
