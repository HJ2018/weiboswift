//
//  PopViewAnimate.swift
//  SwiftWB
//
//  Created by jie.huang on 27/2/19.
//  Copyright © 2019年 MAITIAN. All rights reserved.
//

import UIKit

//代理
//protocol PopViewAnimateDelegate : NSObjectProtocol {
//
//    func willpresented()
//    func willdissmis()
//}

//通知

let PopViewAnimateShow = "PopViewAnimateShow"

let PopViewAnimateDismiss = "PopViewAnimateDismiss"


class PopViewAnimate: NSObject , UIViewControllerTransitioningDelegate , UIViewControllerAnimatedTransitioning{
    
    //    记录是弹出还是消失
    var isPresent : Bool = false
    
    
     var  presentedFrame = CGRect.zero
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?
    {
        
        let pc = PopoverUIPresentationController(presentedViewController: presented, presenting: presenting)
        
        pc.presentedFrame = presentedFrame
        
        return pc
    }
    
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPresent = true
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: PopViewAnimateShow), object: nil)
        return self
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPresent = false
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: PopViewAnimateDismiss), object: nil)
        return self
    }
    
    
    /** 自定义跳转动画时间 */
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.5
    }
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        
        //        let tovc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        
        if isPresent {
            
            let toview = transitionContext.view(forKey: UITransitionContextViewKey.to)
            
            
            transitionContext.containerView.addSubview(toview!)
            
            toview?.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.0)
            
            
            toview?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                
                toview?.transform = CGAffineTransform.identity
                
            }) { (_) in
                
                //            强调  这句话一定要写否则会出现一些未知错误
                transitionContext.completeTransition(true)
            }
            
        }else{
            
            let fromview = transitionContext.view(forKey: UITransitionContextViewKey.from)
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                
                fromview?.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.0000001);
                
            }) { (_) in
                
                //            强调  这句话一定要写否则会出现一些未知错误
                transitionContext.completeTransition(true)
            }
        }
        
    }
}
