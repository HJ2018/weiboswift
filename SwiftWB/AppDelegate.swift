//
//  AppDelegate.swift
//  SwiftWB
//
//  Created by jie.huang on 21/8/18.
//  Copyright © 2018年 MAITIAN. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        UINavigationBar.appearance().tintColor = UIColor.orange
        UITabBar.appearance().tintColor = UIColor.orange
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

