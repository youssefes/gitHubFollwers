//
//  UserInfoVC.swift
//  gitHubFollwers
//
//  Created by youssef on 7/12/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {

    
    var userName : String? {
        didSet{
            guard let user = userName else{return}
            getUserInfo(user: user)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        let donButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVc))
        navigationItem.rightBarButtonItem = donButton

    }
    
    @objc func dismissVc(){
        dismiss(animated: true)
    }
    
    func getUserInfo(user : String){
        NetworkManger.shared.getUserInfo(for: user) { [weak self] resulte in
            switch resulte{
            case .success(let user):
                print(user)
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.presentAlertOnMainthread(title: "someThing error", massage: error.rawValue , buttonTitle: "OK")
                }
                
            }
        }
    }

}
