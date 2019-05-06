//
//  DiscoverTableViewController.swift
//  SwiftWB
//
//  Created by jie.huang on 22/8/18.
//  Copyright © 2018年 MAITIAN. All rights reserved.
//

import UIKit

class DiscoverTableViewController: BaseTableViewontroller {

    override func viewDidLoad() {
        super.viewDidLoad()

        if !userLogin {
            
            vistitorV?.setUpVisitorViewinfo(ishome: false, imageName: "visitordiscover_image_message", message: "登录后最新，最热的微博尽在掌握，不在与实事擦肩而过")
            
        }
    }


}
