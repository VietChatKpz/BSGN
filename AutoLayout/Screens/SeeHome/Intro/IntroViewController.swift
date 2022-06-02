//
//  IntroViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 24/05/2022.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var introTableView: UITableView!
    lazy var refreshControl: UIRefreshControl = {
        let rfc = UIRefreshControl()
        
        return rfc
    }()
    var newFeed: PatientNewFeedModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        introTableView.delegate = self
        introTableView.dataSource = self
        introTableView.register(UINib(nibName: "IntroTableViewCell", bundle: nil), forCellReuseIdentifier: "IntroCell")
        introTableView.separatorStyle = .none
        
        let header = UIView(frame: CGRect(x: 0, y: 44, width: view.bounds.width, height: 300))
        introTableView.tableHeaderView = header
        header.backgroundColor = .blue
        
        introTableView.refreshControl = refreshControl
        self.refreshControl.addTarget(self, action: #selector(fetchPatientNewFeed), for: .valueChanged)
        fetchPatientNewFeed()
        
    }

    @objc func fetchPatientNewFeed() {
//        self.showLoaderView()
        APIUtilities.requestHomePatientFeed(APIURL: "/hdhuy179/9ac0a89969b46fb67bc7d1a8b94d180e/raw") { [weak self] patientNewFeed, error in
            guard let self = self else { return}
//            self.dismissLoaderView()
            self.refreshControl.endRefreshing()

            guard let patientNewFeed = patientNewFeed, error == nil else {
                return
            }

            self.newFeed = patientNewFeed

            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return}

                self.introTableView.reloadData()
            }
        }
    }
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension IntroViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newFeed?.introItem?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = introTableView.dequeueReusableCell(withIdentifier: "IntroCell", for: indexPath) as! IntroTableViewCell
        
        let intro = newFeed?.introItem?[indexPath.row]
        cell.configIntro(intro: intro)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    
}
