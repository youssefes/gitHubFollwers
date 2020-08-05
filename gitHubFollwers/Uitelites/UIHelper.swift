//
//  UIHelper.swift
//  gitHubFollwers
//
//  Created by youssef on 7/11/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

struct UIHelper {
    static func CreateThreeColum(in view : UIView)->UICollectionViewFlowLayout{
        
        let width = view.bounds.width
        let padding : CGFloat = 12
        let minimumSpace : CGFloat = 10
        let avalaibleWidth  = width - (padding * 2) - (minimumSpace * 2)
        
        let itemWidth = avalaibleWidth / 3
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowlayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowlayout
    }

}
