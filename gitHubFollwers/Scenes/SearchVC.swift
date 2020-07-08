//
//  searchVC.swift
//  gitHubFollwers
//
//  Created by youssef on 5/26/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    let LogoImageView = UIImageView()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    let usernameTextField = GFTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImagView()
        configrationUsernameTF()
        configrationCallButtonAction()
        createDismissKeywordGesTap()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    func createDismissKeywordGesTap(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(view.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollwerVC(){
        let follwerVC = follwerListVC()
        
        guard let username = usernameTextField.text, !username.isEmpty else{
            self.presentAlertOnMainthread(title: "Emtey Username", massage: "Please enter Username , We need to know who look to for 😃 ", buttonTitle: "Ok")
        
            return
        }
        follwerVC.username = username
        follwerVC.title = username
        navigationController?.pushViewController(follwerVC, animated: true)
    }
    func  configureLogoImagView(){
        view.addSubview(LogoImageView)
        LogoImageView.translatesAutoresizingMaskIntoConstraints = false
        guard let image  = UIImage(named: "gh-logo") else {
            return
        }
        LogoImageView.image = image
        
        NSLayoutConstraint.activate([
            LogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            LogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            LogoImageView.widthAnchor.constraint(equalToConstant: 200),
            LogoImageView.heightAnchor.constraint(equalToConstant: 200)
        
        ])
    }
    
    func configrationUsernameTF(){
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: LogoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configrationCallButtonAction(){
        view.addSubview(callToActionButton)
        
        callToActionButton.addTarget(self, action: #selector(pushFollwerVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

extension SearchVC : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollwerVC()
        print("done it do")
        return true
    }
}
