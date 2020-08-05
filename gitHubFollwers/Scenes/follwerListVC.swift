//
//  follwerListVCViewController.swift
//  gitHubFollwers
//
//  Created by youssef on 7/8/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class follwerListVC: UIViewController {
    
    enum section {
        case main
    }
    var page : Int = 1
    var hasMoreFollwers = true
    var followers = [Followers]()
    var filterFollwers = [Followers]()
    var isSearch = false
    var username : String?
    var dataSource : UICollectionViewDiffableDataSource<section,Followers>?
    var collectionview : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configrationVC()
        configreSearchController()
        configrationCollectionView()
        getFollowers(userName: username, page: page)
        configrationDataSource()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configrationVC(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func configreSearchController(){
        let searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "search for username"
        navigationItem.searchController = searchController
    }
    
    func getFollowers(userName : String? , page : Int){
        self.showLoadingView()
        guard let user = username else {
            return
        }
        NetworkManger.shared.getFollwers(for: user, page: page) { [weak self] (result) in
            guard let self = self else {return}
            
            switch result {
            case .success(let followers):
                self.DismissView()
                if followers.count < 100 {self.hasMoreFollwers = false }
                self.followers.append(contentsOf: followers)
                if self.followers.isEmpty{
                    let massage = "this User do not have any followers , Go follow than😃."
                    DispatchQueue.main.async {
                        self.showEmptyView(with: massage, view: self.view)
                        
                    }
                    return
                }
                self.updateData(on: followers)
            case .failure(let error) :
                self.presentAlertOnMainthread(title: "bad staf Happen", massage: error.rawValue, buttonTitle: "ok")
            }
        }
    }
    
    
    func configrationCollectionView() {
        collectionview = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.CreateThreeColum(in: view))
        collectionview.delegate = self
        collectionview.register(follwersCell.self, forCellWithReuseIdentifier: follwersCell.reuseID)
        view.addSubview(collectionview)
        collectionview.backgroundColor = .systemBackground
    }
    
    func configrationDataSource(){
        dataSource = UICollectionViewDiffableDataSource<section, Followers>(collectionView: collectionview, cellProvider: { (collectionView, indexpath, followers) -> UICollectionViewCell? in
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: follwersCell.reuseID, for: indexpath) as? follwersCell else{
                return UICollectionViewCell()
            }
            cell.setUp(follower: followers)
            return cell
        })
    }
    
    func updateData(on follwers : [Followers]) {
        var snapshot = NSDiffableDataSourceSnapshot<section, Followers>()
        snapshot.appendSections([.main])
        snapshot.appendItems(follwers)
        DispatchQueue.main.async {
            self.dataSource?.apply(snapshot, animatingDifferences: true)
        }
        
    }
    
}

extension follwerListVC : UICollectionViewDelegate{
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsety = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.height
        
        if offsety > contentHeight - height {
            guard hasMoreFollwers else {
                return
            }
            page += 1
            getFollowers(userName: username, page: page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeFollwer = isSearch ? filterFollwers : followers
        let follwer = activeFollwer[indexPath.item]
        let infoVC  = UserInfoVC()
        infoVC.userName = follwer.login
        let navigationCo = UINavigationController(rootViewController: infoVC)
        present(navigationCo, animated: true)
    }
}

extension follwerListVC : UISearchResultsUpdating , UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filterText = searchController.searchBar.text ,!filterText.isEmpty else{return}
        
        filterFollwers = followers.filter({ $0.login.lowercased().contains(filterText.lowercased())})
        isSearch = true
        updateData(on: filterFollwers)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearch = false
        
        updateData(on: followers)
    }
}
