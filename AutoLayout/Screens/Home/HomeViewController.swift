//
//  HomeViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/05/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var newsCollectionView: UICollectionView!
    @IBOutlet weak var promoCollectionView: UICollectionView!
    @IBOutlet weak var introduceCollectionView: UICollectionView!
    
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
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == newsCollectionView {
            let cell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsCollectionViewCell
            
            return cell
        }
        else if collectionView == promoCollectionView {
            let cell = promoCollectionView.dequeueReusableCell(withReuseIdentifier: "PromoCell", for: indexPath) as! PromoCollectionViewCell
            return cell
        }else {
            let cell = introduceCollectionView.dequeueReusableCell(withReuseIdentifier: "IntroCell", for: indexPath) as! IntroduceCollectionViewCell
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == introduceCollectionView {
            return CGSize(width: 121, height: introduceCollectionView.bounds.height)
        }else {
            return CGSize(width: 258, height: newsCollectionView.bounds.height)
        }
    }
}
