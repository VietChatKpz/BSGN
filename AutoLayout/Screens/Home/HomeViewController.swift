//
//  HomeViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/05/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var newsCollectionView: UICollectionView!
    @IBOutlet weak var promoCollectionView: UICollectionView!
    @IBOutlet weak var introduceCollectionView: UICollectionView!
    @IBOutlet weak var avatarView: UIView!
    
    lazy var refreshControl: UIRefreshControl = {
        let rfc = UIRefreshControl()
        
        return rfc
    }()
    
    var newFeed: PatientNewFeedModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        newsCollectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCell")
        
        promoCollectionView.delegate = self
        promoCollectionView.dataSource = self
        promoCollectionView.register(UINib(nibName: "PromoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PromoCell")
        
        introduceCollectionView.delegate = self
        introduceCollectionView.dataSource = self
        introduceCollectionView.register(UINib(nibName: "IntroduceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IntroCell")
        
        newsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        promoCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        introduceCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
                
        avatarView.backgroundColor = UIColor.clear
        
        homeScrollView.refreshControl = refreshControl
        self.refreshControl.addTarget(self, action: #selector(fetchPatientNewFeed), for: .valueChanged)
        fetchPatientNewFeed()
                
    }
    
    @objc func fetchPatientNewFeed() {
//        self.showLoaderView()
        APIUtilities.requestHomePatientFeed(APIURL: "/hdhuy179/f967ffb777610529b678f0d5c823352a/raw"){ [weak self] patientNewFeed, error in
                        
            guard let self = self else { return}
//            self.dismissLoaderView()
            self.refreshControl.endRefreshing()

            guard let patientNewFeed = patientNewFeed, error == nil else {
                return
            }

            self.newFeed = patientNewFeed

            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return}

                self.newsCollectionView.reloadData()
                self.promoCollectionView.reloadData()
                self.introduceCollectionView.reloadData()
            }
        }
    }
    
    @IBAction func newsOnPress(_ sender: Any) {
        let vc = NewsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func promoOnPress(_ sender: Any) {
        let vc = PromoViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func introOnPress(_ sender: Any) {
        let vc = IntroViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func avatarOnPress(_ sender: Any) {
        let vc = UserViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == newsCollectionView {
            return newFeed?.newList?.count ?? 0
        }else if collectionView == promoCollectionView {
            return newFeed?.promoList?.count ?? 0
        }else{
            return newFeed?.introList?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == newsCollectionView {
            let cell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsCollectionViewCell
            
            let news = newFeed?.newList?[indexPath.row]
//            print(news)
            cell.configViews(news: news)
            cell.setUpNew()
            return cell
        }
        else if collectionView == promoCollectionView {
            let cell = promoCollectionView.dequeueReusableCell(withReuseIdentifier: "PromoCell", for: indexPath) as! PromoCollectionViewCell
            
            let promos = newFeed?.promoList?[indexPath.row]
            cell.configViews(promos: promos)
            cell.setUpPromo()
            
            return cell
        }else {
            let cell = introduceCollectionView.dequeueReusableCell(withReuseIdentifier: "IntroCell", for: indexPath) as! IntroduceCollectionViewCell
            
            let intros = newFeed?.introList?[indexPath.row]
            cell.configViews(intros: intros)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == newsCollectionView {
            let vc = DetailsViewController()
            navigationController?.pushViewController(vc, animated: true)
            vc.linkURL = newFeed?.newList?[indexPath.row].link ?? ""
        }else if collectionView == promoCollectionView {
            let vc = DetailsViewController()
            navigationController?.pushViewController(vc, animated: true)
            vc.linkURL = newFeed?.promoList?[indexPath.row].link ?? ""
        }else{
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == introduceCollectionView {
            return CGSize(width: 121/185*introduceCollectionView.bounds.height, height: introduceCollectionView.bounds.height)
        }else {
            return CGSize(width: 258/220*newsCollectionView.bounds.height, height: newsCollectionView.bounds.height)
        }
    }
    
}
