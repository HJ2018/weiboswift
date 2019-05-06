//
//  PopoverUIPresentationController.swift
//  SwiftWB
//
//  Created by jie.huang on 27/2/19.
//  Copyright © 2019年 MAITIAN. All rights reserved.
//

import UIKit

class PopoverUIPresentationController: UIPresentationController {
    
    
    
    var  presentedFrame = CGRect.zero
    
    
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super .init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        
        print(presentedViewController)
//        print(presentingViewController!)
    }
    
    
    
    
    override func containerViewWillLayoutSubviews() {
        
//        containerView
        if presentedFrame == CGRect.zero {
            
            presentedView?.frame = CGRect(x: 100, y: 56 + 34, width: 200, height: 200)
            
        }else{
          presentedView?.frame = presentedFrame
        }
        
        containerView?.insertSubview(coverView, at: 0)
    }
    
    
    
    
    //    MARK: - 懒加载
    
    private lazy var coverView : UIView = {
       
        let view = UIView()
        view.frame = UIScreen.main.bounds
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeClick))
        view.addGestureRecognizer(tap)
        
        return view;
    }()
    
    @objc func closeClick(){
        
        presentedViewController.dismiss(animated: true, completion: nil)
    }

}
