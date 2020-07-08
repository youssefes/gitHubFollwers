//
//  follwerListVCViewController.swift
//  gitHubFollwers
//
//  Created by youssef on 7/8/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class follwerListVC: UIViewController {

    
    var username : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
        guard let user = username else {
            return
        }
        NetworkManger.shared.getFollwers(for: user, page: 1) { (followers, errorMassage) in
            guard let follower = followers else {
                self.presentAlertOnMainthread(title: "bad staf Happen", massage: errorMassage!.rawValue, buttonTitle: "ok")
                return
            }
            print(follower.count)
            print(follower)
        }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
