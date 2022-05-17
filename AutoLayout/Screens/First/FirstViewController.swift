//
//  FirstViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/05/2022.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var LogincollectionView: UICollectionView!
    @IBOutlet weak var myPage: UIPageControl!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerButton.layer.borderColor = UIColor(red: 0.14, green: 0.16, blue: 0.38, alpha: 1.00).cgColor
        registerButton.layer.borderWidth = 1.0
        
        LogincollectionView.frame = view.bounds
        LogincollectionView.delegate = self
        LogincollectionView.dataSource = self
        LogincollectionView.register(UINib(nibName: "LoginCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LoginCell")
        
        LogincollectionView.backgroundView?.backgroundColor = UIColor.clear
        LogincollectionView.backgroundColor = UIColor.clear
        
        myPage.numberOfPages = arrLogin.count
        myPage.currentPage = 0
    }
    @IBAction func loginButton(_ sender: Any) {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }
    @IBAction func registerButton(_ sender: Any) {
        
    }
    
}

extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrLogin.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = LogincollectionView.dequeueReusableCell(withReuseIdentifier: "LoginCell", for: indexPath) as! LoginCollectionViewCell
        cell.setUp(with: arrLogin[indexPath.row])
        myPage.currentPage = indexPath.row
        return cell
    }
}
extension FirstViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: LogincollectionView.frame.width, height: LogincollectionView.frame.height)
    }
}

