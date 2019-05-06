//
//  MessageTableViewController.swift
//  SwiftWB
//
//  Created by jie.huang on 22/8/18.
//  Copyright © 2018年 MAITIAN. All rights reserved.
//

import UIKit

class MessageTableViewController: BaseTableViewontroller {

    override func viewDidLoad() {
        super.viewDidLoad()

        if !userLogin {
            
            vistitorV?.setUpVisitorViewinfo(ishome: false, imageName: "visitordiscover_image_message", message: "登录后，别人评论你的微博，发给你的消息，都会在这里通知")
            
        }
    }


}
