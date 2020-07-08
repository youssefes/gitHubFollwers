//
//  UIViewcontroller+Extention.swift
//  gitHubFollwers
//
//  Created by youssef on 7/8/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

extension UIViewController{
    func presentAlertOnMainthread(title : String, massage : String, buttonTitle : String){
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, massage: massage, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overCurrentContext
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true, completion: nil)
        }
    }
}
