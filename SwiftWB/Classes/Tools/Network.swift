//
//  Network.swift
//  SwiftWB
//
//  Created by jie.huang on 26/1/19.
//  Copyright © 2019年 MAITIAN. All rights reserved.
//

import UIKit
import AFNetworking

class Network: AFHTTPSessionManager {
    
    
        static let tools:Network = {
            // 注意: baseURL一定要以/结尾
            let url = NSURL(string: "https://api.weibo.com/")
            let t = Network(baseURL: url! as URL)
            
            // 设置AFN能够接收得数据类型
            t.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json", "text/json", "text/javascript", "text/plain") as? Set<String>
            return t
        }()
        
        /// 获取单粒的方法
        class func shareNetworkTools() -> Network {
            return tools
        }
    }

