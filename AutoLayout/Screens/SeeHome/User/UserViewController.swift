//
//  UserViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 28/05/2022.
//

import UIKit

class UserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyBoard()
        // Do any additional setup after loading the view.
    }
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
