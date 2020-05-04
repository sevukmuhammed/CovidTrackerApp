//
//  ViewController6.swift
//  Covid
//
//  Created by user on 4/27/20.
//  Copyright © 2020 Muhammed Sevuk. All rights reserved.
//

import UIKit
import WebKit
class ViewController6: UIViewController, WKUIDelegate {
    var url: String = ""
    var webView: WKWebView!
    override func loadView() {
           
           let webConfiguration = WKWebViewConfiguration()
           webView = WKWebView(frame: .zero, configuration: webConfiguration)
           webView.uiDelegate = self
           view = webView
    
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(url)
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
