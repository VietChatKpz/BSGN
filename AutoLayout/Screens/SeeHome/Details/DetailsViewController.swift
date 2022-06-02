//
//  DetailsViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 31/05/2022.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    var linkURL = ""
    var copyURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlStr = linkURL 
        let request = URLRequest(url: URL(string: urlStr)!)
        self.webView.load(request)
        
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
    }
    
}

