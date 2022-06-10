//
//  DetailsViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 31/05/2022.
//

import UIKit
import WebKit
import ToastViewSwift

class DetailsViewController: UIViewController {

    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var linkURL = ""
    var copyURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlStr = linkURL 
        let request = URLRequest(url: URL(string: urlStr)!)
        self.webView.load(request)
        
        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            if webView.isLoading {
                activityIndicator.startAnimating()
                activityIndicator.isHidden = false
            }else {
                activityIndicator.stopAnimating()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func copyOnPress(_ sender: Any) {
        copyURL = linkURL
        UIPasteboard.general.string = copyURL
        let toast = Toast.text("Đã sao chép URL")
        toast.show()
    }
    
}

