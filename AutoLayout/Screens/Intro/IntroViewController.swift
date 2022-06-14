//
//  FirstViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/05/2022.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var LogincollectionView: UICollectionView!
    @IBOutlet weak var myPage: UIPageControl!
     
    var currentPage = 0 {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return}
                
                self.updateUIWith(currentPage: self.currentPage)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerButton.layer.borderColor = UIColor(red: 0.14, green: 0.16, blue: 0.38, alpha: 1.00).cgColor
        registerButton.layer.borderWidth = 1.0
        
        LogincollectionView.delegate = self
        LogincollectionView.dataSource = self
        LogincollectionView.register(UINib(nibName: "LoginCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LoginCell")
        
        LogincollectionView.backgroundView?.backgroundColor = UIColor.clear
        LogincollectionView.backgroundColor = UIColor.clear
        
        myPage.currentPage = 0
        myPage.numberOfPages = arrLogin.count
    }
    func updateUIWith(currentPage: Int) {
        myPage.currentPage = currentPage
    }

    @IBAction func loginButton(_ sender: Any) {
        let loginVC = LoginViewController()
//        loginVC.modalPresentationStyle = .fullScreen
//        present(loginVC, animated: true)
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    @IBAction func registerButton(_ sender: Any) {
        
    }
    
}

extension IntroViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrLogin.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = LogincollectionView.dequeueReusableCell(withReuseIdentifier: "LoginCell", for: indexPath) as! LoginCollectionViewCell
        
        cell.setUp(with: arrLogin[indexPath.row])
        return cell
    }
    
}
extension IntroViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: LogincollectionView.frame.width, height: LogincollectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var currentPage = Int(scrollView.contentOffset.x/UIScreen.main.bounds.width)
        
        currentPage = min(currentPage, arrLogin.count - 1)
        currentPage = max(currentPage, 0)
        
        self.currentPage = currentPage
    }
}
