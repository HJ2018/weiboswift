//
//  oAuthController.swift
//  SwiftWB
//
//  Created by jie.huang on 28/2/19.
//  Copyright © 2019年 MAITIAN. All rights reserved.
//

import UIKit

class oAuthController: UIViewController {
    
    
    let WB_aap_key = "2465379324"
    let WB_app_Secret = "d2a37e4d44b77b6091bc0394e3801743"
    let redirect_uri = "https://user.qzone.qq.com/597079127/infocenter"
    
    
    
    override func loadView() {
        
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let urlStr = "https://api.weibo.com/oauth2/authorize?client_id=\(WB_aap_key)&redirect_uri=\(redirect_uri)"
        
        let url_api = NSURL(string: urlStr)
        
        let request = NSURLRequest(url: url_api! as URL)
        
        webView.loadRequest(request as URLRequest)
        
        
    }
    
    private lazy var webView : UIWebView = {
        
        let wv = UIWebView()
        return wv;
        
    }()

}
