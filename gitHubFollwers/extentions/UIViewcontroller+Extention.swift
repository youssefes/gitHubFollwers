//
//  UIViewcontroller+Extention.swift
//  gitHubFollwers
//
//  Created by youssef on 7/8/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
fileprivate var containerView : UIView!
extension UIViewController{
    func presentAlertOnMainthread(title : String, massage : String, buttonTitle : String){
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, massage: massage, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overCurrentContext
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    
    func showLoadingView(){
        containerView = UIView(frame: view.bounds)
        
        view.addSubview(containerView)
        containerView.alpha = 0
        containerView.backgroundColor = .systemBackground
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        let activityIndictor = UIActivityIndicatorView()
        
        containerView.addSubview(activityIndictor)
        activityIndictor.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndictor.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndictor.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        activityIndictor.startAnimating()
    }
    
    func DismissView(){
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
        
    }
    
    func showEmptyView(with massage: String, view : UIView) {
        let emptyview = EmptyStateView(massage: massage)
        emptyview.frame = view.bounds
        view.addSubview(emptyview)
    }
}
