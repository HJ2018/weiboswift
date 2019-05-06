//
//  ProfileTableViewController.swift
//  SwiftWB
//
//  Created by jie.huang on 22/8/18.
//  Copyright © 2018年 MAITIAN. All rights reserved.
//

import UIKit

class ProfileTableViewController: BaseTableViewontroller {

    override func viewDidLoad() {
        super.viewDidLoad()

        if !userLogin {
            
            vistitorV?.setUpVisitorViewinfo(ishome: false, imageName: "visitordiscover_image_profile", message: "登录后你的微博，个人相处都在这里展出给你别人")
            
        }
    }
    
}
