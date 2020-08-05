//
//  GFAlertVC.swift
//  gitHubFollwers
//
//  Created by youssef on 7/8/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let ContainerView = UIView()
    let titleLbl = GHtitleLable(Alighnment: .center, fonSize: 20)
    let MassageLable = GHBodyLible(Alighnment: .center)
    let ActionButton = GFButton(backgroundColor: UIColor.systemPink, title: "20")
    
    var Alerttitle: String?
    var massage : String?
    var buttonTitle : String?
    var padding : CGFloat = 20
    
    init(title : String, massage : String, buttonTitle : String) {
        super.init(nibName : nil, bundle : nil)
        self.Alerttitle = title
        self.massage = massage
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configrationContainerView()
        configrationTitleLable()
        
        configrationActionButton()
        configrationMassageLable()
        
    }
    
    
    func configrationContainerView(){
        view.addSubview(ContainerView)
        
        ContainerView.backgroundColor = .systemBackground
        ContainerView.layer.cornerRadius = 16
        ContainerView.layer.borderColor = UIColor.white.cgColor
        ContainerView.layer.borderWidth = 2
        ContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ContainerView.widthAnchor.constraint(equalToConstant: 280),
            ContainerView.heightAnchor.constraint(equalToConstant: 250)
            
            
        ])
        
    }
    
    func configrationTitleLable() {
        ContainerView.addSubview(titleLbl)
        titleLbl.text = Alerttitle ?? "something Wronge"
        
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: ContainerView.topAnchor, constant: padding),
            titleLbl.leadingAnchor.constraint(equalTo: ContainerView.leadingAnchor, constant: padding),
            titleLbl.trailingAnchor.constraint(equalTo: ContainerView.trailingAnchor, constant: -padding),
            titleLbl.heightAnchor.constraint(equalToConstant: 28)
            
            
        ])
        
    }
    
    func configrationActionButton() {
        ContainerView.addSubview(ActionButton)
        ActionButton.setTitle("OK", for: .normal)
        ActionButton.addTarget(self, action: #selector(dismissView), for: UIControl.Event.touchUpInside)
        
        NSLayoutConstraint.activate([
            ActionButton.bottomAnchor.constraint(equalTo: ContainerView.bottomAnchor, constant: -padding),
            ActionButton.leadingAnchor.constraint(equalTo: ContainerView.leadingAnchor, constant: padding),
            ActionButton.trailingAnchor.constraint(equalTo: ContainerView.trailingAnchor, constant: -padding),
            ActionButton.heightAnchor.constraint(equalToConstant: 44)
            
            
        ])
    }
    
    func configrationMassageLable(){
        ContainerView.addSubview(MassageLable)
        
        MassageLable.text = massage ?? "Unable to complate request"
        MassageLable.numberOfLines = 4
        NSLayoutConstraint.activate([
            
            MassageLable.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 8),
            MassageLable.leadingAnchor.constraint(equalTo: ContainerView.leadingAnchor, constant: padding),
            MassageLable.trailingAnchor.constraint(equalTo: ContainerView.trailingAnchor, constant: -padding),
            MassageLable.bottomAnchor.constraint(equalTo: ActionButton.topAnchor, constant: -12)
        ])
    }
    
    @objc func dismissView(){
        dismiss(animated: true, completion: nil)
    }
    
}
