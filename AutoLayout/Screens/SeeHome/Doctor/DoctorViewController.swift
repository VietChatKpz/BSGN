//
//  IntroViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 24/05/2022.
//

import UIKit

class DoctorViewController: UIViewController {

    @IBOutlet weak var introTableView: UITableView!
    
    lazy var refreshControl: UIRefreshControl = {
        let rfc = UIRefreshControl()
        
        return rfc
    }()
    var doctorList: [DoctorAPI]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        introTableView.delegate = self
        introTableView.dataSource = self
        introTableView.register(UINib(nibName: "DoctorTableViewCell", bundle: nil), forCellReuseIdentifier: "IntroCell")
        introTableView.separatorStyle = .none
        
        introTableView.refreshControl = refreshControl
        self.refreshControl.addTarget(self, action: #selector(fetchPatientNewFeed), for: .valueChanged)
        fetchPatientNewFeed()
//        introTableView.estimatedRowHeight = 500
//        introTableView.rowHeight = UITableView.automaticDimension
    }

    @objc func fetchPatientNewFeed() {
//        self.showLoaderView()
        APIUtilities.requestDoctor { [weak self] patientDoctor, error in
            guard let self = self else { return}
//            self.dismissLoaderView()
            self.refreshControl.endRefreshing()

            guard let patientDoctor = patientDoctor, error == nil else {
                return
            }

            self.doctorList = patientDoctor

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

extension DoctorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctorList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = introTableView.dequeueReusableCell(withIdentifier: "IntroCell", for: indexPath) as! DoctorTableViewCell
        
        let intro = doctorList?[indexPath.row]
        cell.configIntro(intro: intro)
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let vc = DoctorTableViewCell()
//        return 118
//    }
}
