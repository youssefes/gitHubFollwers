//
//  UserInfoHeaderVC.swift
//  gitHubFollwers
//
//  Created by youssef on 7/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class UserInfoHeaderVC: UIViewController {

    
    let avaterImage = GFAveterImage(frame: .zero)
    let titleName = GHtitleLable(Alighnment: .left, fonSize: 34)
    let secondaryTitle = GFSecondaryTitleLable(fonSize: 18)
    let locationImage = UIImageView()
    let locationLable = GFSecondaryTitleLable(fonSize: 18)
    let bioLable = GHBodyLible(Alighnment: .left)
    
    var user : User?
    
    init(user : User) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        LayoutUI()

    }
    
    func addSubViews(){
        view.addSubview(avaterImage)
        view.addSubview(titleName)
        view.addSubview(secondaryTitle)
        view.addSubview(locationImage)
        view.addSubview(locationLable)
        view.addSubview(bioLable)
    }

    func LayoutUI(){
        let padding : CGFloat = 20
        let imagePadding : CGFloat = 10
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avaterImage.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avaterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            avaterImage.widthAnchor.constraint(equalToConstant: 90),
            avaterImage.heightAnchor.constraint(equalToConstant: 90),
            
            titleName.topAnchor.constraint(equalTo: avaterImage.topAnchor),
            titleName.leadingAnchor.constraint(equalTo: avaterImage.trailingAnchor, constant: imagePadding),
            titleName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            titleName.heightAnchor.constraint(equalToConstant: 38),
            
            secondaryTitle.centerYAnchor.constraint(equalTo: avaterImage.centerYAnchor, constant: 8),
            secondaryTitle.leadingAnchor.constraint(equalTo: avaterImage.trailingAnchor, constant: imagePadding),
            secondaryTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            secondaryTitle.heightAnchor.constraint(equalToConstant: 20),
            
            locationImage.bottomAnchor.constraint(equalTo: avaterImage.bottomAnchor),
            locationImage.leadingAnchor.constraint(equalTo: avaterImage.trailingAnchor, constant: padding),
            locationImage.widthAnchor.constraint(equalToConstant: 20),
            locationImage.heightAnchor.constraint(equalToConstant: 20),
            
            locationLable.centerYAnchor.constraint(equalTo: locationImage.centerYAnchor),
            locationLable.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 5),
            locationLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            locationLable.heightAnchor.constraint(equalToConstant: 20),
            
            bioLable.topAnchor.constraint(equalTo: avaterImage.bottomAnchor, constant: imagePadding),
            bioLable.leadingAnchor.constraint(equalTo: avaterImage.leadingAnchor),
            bioLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bioLable.heightAnchor.constraint(equalToConstant: 60),
            
        
        ])
    }

}
