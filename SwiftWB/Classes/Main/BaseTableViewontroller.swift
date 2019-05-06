//
//  BaseTableViewontroller.swift
//  SwiftWB
//
//  Created by jie.huang on 11/10/18.
//  Copyright © 2018年 MAITIAN. All rights reserved.
//

import UIKit

class BaseTableViewontroller: UITableViewController , VisitorViewDelegate{
    
    
    
    var userLogin = true
    
    var vistitorV : VisitorView?
    
    
    override func loadView() {
       userLogin ? super.loadView() : setUpcustView()
    }
    
    private func setUpcustView(){
        let custView = VisitorView()
        custView.delegate = self
        view = custView
        vistitorV = custView
        
        
        
        navigationController?.navigationBar.tintColor = UIColor.orange
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(regclick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(Loginclick))
    }
    
    
    @objc func regclick(){
        
    }
    
    
    @objc func Loginclick(){
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func loginBtnWillClick() {
        
        print("11111")
    }
    
    func registerBtnWillClick() {
        
        print("22222")
    }



}
