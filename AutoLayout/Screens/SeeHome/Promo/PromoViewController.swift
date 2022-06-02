//
//  PromoViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 24/05/2022.
//

import UIKit

class PromoViewController: UIViewController {

    @IBOutlet weak var promoTableView: UITableView!
    var promos = [Promo]()
    
    lazy var refreshControl: UIRefreshControl = {
        let rfc = UIRefreshControl()
        
        return rfc
    }()
    var newFeed: PatientNewFeedModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        promoTableView.delegate = self
        promoTableView.dataSource = self
        promoTableView.register(UINib(nibName: "PromoTableViewCell", bundle: nil), forCellReuseIdentifier: "PromoCell")
        
        promoTableView.refreshControl = refreshControl
        self.refreshControl.addTarget(self, action: #selector(fetchPatientNewFeed), for: .valueChanged)
        fetchPatientNewFeed()
        
        let promo1 = Promo(isSelected: true)
        let promo2 = Promo(isSelected: true)
        
        promos = [promo1, promo2]
    }
    
    @objc func fetchPatientNewFeed() {
//        self.showLoaderView()
        APIUtilities.requestHomePatientFeed(APIURL: "/hdhuy179/ef03ed850ad56f0136fe3c5916b3280b/raw/Training_Intern_BasicApp_Promotion") { [weak self] patientNewFeed, error in
            guard let self = self else { return}
//            self.dismissLoaderView()
            self.refreshControl.endRefreshing()

            guard let patientNewFeed = patientNewFeed, error == nil else {
                return
            }

            self.newFeed = patientNewFeed

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
        return newFeed?.promoItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = promoTableView.dequeueReusableCell(withIdentifier: "PromoCell", for: indexPath) as! PromoTableViewCell
        
        let promo = newFeed?.promoItems?[indexPath.row]
        cell.configPromo(promo: promo)
        
        cell.checkAction = {[weak self] in
            // check self co bi nil khong, neu khong bi nil thi gan self cho strongSelf
            guard let strongSelf = self else { return }

            strongSelf.promos[indexPath.row].isSelected = !strongSelf.promos[indexPath.row].isSelected
            tableView.reloadData()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
}

