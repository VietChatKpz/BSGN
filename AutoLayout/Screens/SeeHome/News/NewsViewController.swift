//
//  NewsViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 24/05/2022.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var newView: UIView!
    @IBOutlet weak var newTableView: UITableView!
    
    lazy var refreshControl: UIRefreshControl = {
        let rfc = UIRefreshControl()
        
        return rfc
    }()
    
    var newList: [NewAPI]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newTableView.delegate = self
        newTableView.dataSource = self
        newTableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "NewCell")
        newTableView.register(UINib(nibName: "NewDefaultTableViewCell", bundle: nil), forCellReuseIdentifier: "NewDefault")
        newTableView.separatorStyle = .none

        newTableView.refreshControl = refreshControl
        self.refreshControl.addTarget(self, action: #selector(fetchPatientNewFeed), for: .valueChanged)
        fetchPatientNewFeed()
        
    }
    
    @objc func fetchPatientNewFeed() {
//        self.showLoaderView()
        APIUtilities.requestNew { [weak self] patientNew, error in
            guard let self = self else { return}
//            self.dismissLoaderView()
            self.refreshControl.endRefreshing()

            guard let patientNew = patientNew, error == nil else {
                return
            }

            self.newList = patientNew

            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return}

                self.newTableView.reloadData()
            }
        }
    }

    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 296
        }else{
            return 131
        }
    }
}

extension NewsViewController: UITableViewDataSource{    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = newTableView.dequeueReusableCell(withIdentifier: "NewDefault", for: indexPath) as! NewDefaultTableViewCell
            
            let new = newList?[indexPath.row]
            cell.configNew(new: new)
            return cell
        }
        else {
            let cell = newTableView.dequeueReusableCell(withIdentifier: "NewCell", for: indexPath) as! NewTableViewCell
            
            let new = newList?[indexPath.row]
            cell.configNew(new: new)
            return cell

        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        vc.linkURL = newList?[indexPath.row].link ?? ""
    }
    
}
