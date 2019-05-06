//
//  UIBarButtonItem+Category.swift
//  SwiftWB
//
//  Created by jie.huang on 27/2/19.
//  Copyright © 2019年 MAITIAN. All rights reserved.
//

import Foundation
import UIKit


extension  UIBarButtonItem {
    
    
    class func creatBarBUttomItem(imageName : String , target : AnyObject? , action : Selector) ->UIBarButtonItem {
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.sizeToFit()
        return UIBarButtonItem(customView: btn)
    }
    
}
