//
//  HomeTableViewController.swift
//  SwiftWB
//
//  Created by jie.huang on 22/8/18.
//  Copyright © 2018年 MAITIAN. All rights reserved.
//

import UIKit
import Alamofire
import AFNetworking
class HomeTableViewController: BaseTableViewontroller  {
    
    
    let WB_aap_key = "2465379324"
    let WB_app_Secret = "d2a37e4d44b77b6091bc0394e3801743"
    let redirect_uri = "https://user.qzone.qq.com/597079127/infocenter"

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if !userLogin {
            
            vistitorV?.setUpVisitorViewinfo(ishome: true, imageName: "visitordiscover_feed_image_house", message: "关注一些人，看看这里有什么惊喜")
            
        }
        
        setupNav()
        
        NotificationCenter.default.addObserver(self, selector: #selector(Change), name: NSNotification.Name(rawValue: PopViewAnimateShow), object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(Change), name: NSNotification.Name(rawValue: PopViewAnimateDismiss), object: nil)
        
//        let parameters: Dictionary = ["username" : "sxj"]
//        Alamofire.request("http://127.0.0.1:8888/ISAPI", method: HTTPMethod.get, parameters: parameters).responseJSON { (response) in
//            switch response.result {
//            case .success:
//                print("SUCCESS")
//                print(response.result.value!)
//            case .failure:
//                print("ERROR")
//            }
//            }
    }
    
    
    
    
    
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    @objc func Change(){
        
        let titleBtn = navigationItem.titleView as! TitleUIButton
        
        titleBtn.isSelected = !titleBtn.isSelected
        

    }
    
    
    
    func setupNav(){

//        navigationItem.leftBarButtonItem = creatBarBUttomItem(imageName: "navigationbar_friendattention" ,target: self , action: #selector(leftClick))
//
//        navigationItem.rightBarButtonItem = creatBarBUttomItem(imageName: "navigationbar_pop",target: self , action: #selector(rightClick))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.creatBarBUttomItem(imageName: "navigationbar_friendattention", target: self, action: #selector(leftClick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.creatBarBUttomItem(imageName: "navigationbar_pop", target: self, action: #selector(rightClick))
        
        
        let titlebnt = TitleUIButton();
        titlebnt.setTitle("微博Demo", for: .normal)
        titlebnt.addTarget(self, action: #selector(Titileclick(button:)), for: .touchUpInside)
        navigationItem.titleView = titlebnt
        
    }
    
    
    @objc func Titileclick(button : TitleUIButton){
        
//        button.isSelected = !button.isSelected
        
        let sb = UIStoryboard(name: "PopView", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        
        vc?.transitioningDelegate = PopAnimate
        vc?.modalPresentationStyle = UIModalPresentationStyle.custom
        present(vc!, animated: true, completion: nil)
    }
    
    
    
    @objc func leftClick(){
        
        
    }
    
 
    
    @objc func rightClick(){
        
        let sb = UIStoryboard.init(name: "QRCodeViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        present(vc!, animated: true, completion: nil)
        
        
    }
    


    //    一定要自定义属性来定义转场对象
    private lazy var PopAnimate : PopViewAnimate = {
        
        let pa = PopViewAnimate()
        pa.presentedFrame = CGRect(x: 100, y: 56 + 34, width: 200, height: 300)
        return pa
        
    }()
    
    
//    private func creatBarBUttomItem(imageName : String , target : AnyObject? , action : Selector) ->UIBarButtonItem{
//
//
//        let btn = UIButton()
//
//        btn.setImage(UIImage(named: imageName), for: .normal)
//        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
//        btn.addTarget(target, action: action, for: .touchUpInside)
//        btn.sizeToFit()
//        return UIBarButtonItem(customView: btn)
//
//    }
    

}


