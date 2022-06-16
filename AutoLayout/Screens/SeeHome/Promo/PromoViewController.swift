//
//  PromoViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 24/05/2022.
//

import UIKit

class PromoViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var promoTableView: UITableView!
    
    lazy var refreshControl: UIRefreshControl = {
        let rfc = UIRefreshControl()
        
        return rfc
    }()
    var promoList: [PromoAPI]?
    override func viewDidLoad() {
        super.viewDidLoad()

        promoTableView.delegate = self
        promoTableView.dataSource = self
        promoTableView.register(UINib(nibName: "PromoTableViewCell", bundle: nil), forCellReuseIdentifier: "PromoCell")
        
        promoTableView.refreshControl = refreshControl
        self.refreshControl.addTarget(self, action: #selector(fetchPatientNewFeed), for: .valueChanged)
        fetchPatientNewFeed()
        
        firstView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        firstView.layer.shadowOpacity = 1
        firstView.layer.shadowRadius = 30
        firstView.layer.shadowOffset = CGSize(width: 0, height: 0)
                
    }
    
    @objc func fetchPatientNewFeed() {
//        self.showLoaderView()
        APIUtilities.requestPromo { [weak self] patientPromo, error in
            guard let self = self else { return}
//            self.dismissLoaderView()
            self.refreshControl.endRefreshing()

            guard let patientPromo = patientPromo, error == nil else {
                return
            }

            self.promoList = patientPromo

            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return}

                self.promoTableView.reloadData()
            }
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension PromoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promoList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = promoTableView.dequeueReusableCell(withIdentifier: "PromoCell", for: indexPath) as! PromoTableViewCell
        
        let promo = promoList?[indexPath.row]
        cell.configPromo(promo: promo)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        vc.linkURL = promoList?[indexPath.row].link ?? ""
    }
}

