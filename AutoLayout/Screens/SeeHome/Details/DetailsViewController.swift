//
//  DetailsViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 31/05/2022.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var linkURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlStr = linkURL ?? ""
        let request = URLRequest(url: URL(string: urlStr)!)
        self.webView.load(request)
        
//        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading),options: .new, context: nil)
    }
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "loading"{
//            if webView.isLoading {
//                activityIndicator.startAnimating()
//                activityIndicator.isHidden = false
//            }else {
//                activityIndicator.stopAnimating()
//            }
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

