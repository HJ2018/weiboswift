//
//  VisitorView.swift
//  SwiftWB
//
//  Created by jie.huang on 26/1/19.
//  Copyright © 2019年 MAITIAN. All rights reserved.
//

import UIKit

import SnapKit



//swift 定义协议
protocol VisitorViewDelegate : NSObjectProtocol {
    
    func loginBtnWillClick()
    
    func registerBtnWillClick()
}



class VisitorView: UIView {
    
    
    
//     定义属性保存代理
    
    weak var delegate : VisitorViewDelegate?
    
    
    
    func setUpVisitorViewinfo(ishome : Bool , imageName : String , message : String){
        
        iconImageView.isHidden = !ishome
        
        homeImage.image = UIImage(named: imageName)
        
        messagelable.text = message
        
        if ishome {
            
            startAnimation()
        }
    }
    
    
    override init(frame: CGRect) {
        
        
        super.init(frame: frame)
        
        
        addSubview(iconImageView)
        
        addSubview(homeImage)
        
        addSubview(messagelable)
        
        addSubview(loginButton)
        
        addSubview(registerButton)
        
        iconImageView.snp.makeConstraints { (make) in
            
             make.center.equalToSuperview()

        }
        
        homeImage.snp.makeConstraints { (make) in
            
            make.center.equalToSuperview()
            
            
        }
        
        messagelable.snp.makeConstraints { (make) in
            
            make.top.equalTo(iconImageView.snp.bottom)
            make.centerX.equalTo(iconImageView)
            make.width.equalTo(220)
//            make.height.equalTo(35)
        }
        
        loginButton.snp.makeConstraints { (make) in
            
            
            make.top.equalTo(messagelable.snp.bottom)
            make.centerX.equalTo(messagelable).offset(-70)
            make.width.equalTo(120)
            make.height.equalTo(45)
        }
        
        registerButton.snp.makeConstraints { (make) in
            
            
            make.top.equalTo(messagelable.snp.bottom)
            make.centerX.equalTo(messagelable).offset(70)
            make.width.equalTo(120)
            make.height.equalTo(45)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //    MARK: - 内部方法
    
    private func startAnimation(){
        
        let anmi = CABasicAnimation(keyPath: "transform.rotation")
        
        anmi.toValue = 2 * Double.pi
        
        anmi.duration = 20
        
        anmi.repeatCount = MAXFLOAT
        
        anmi.isRemovedOnCompletion = false
        
        iconImageView.layer.add(anmi, forKey: nil)
        
    }
    
    
    //    MARK: - 懒加载
    
    
    private lazy var iconImageView : UIImageView = {
        
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        
        return iv
    }()
    
    
    private lazy var homeImage : UIImageView = {
        
        let hv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        
        return hv
    }()
    
    
    private lazy var messagelable : UILabel = {
        
        let ml = UILabel()
        
        ml.numberOfLines = 0
        
        ml.textAlignment = .center
        
        ml.textColor = UIColor.lightGray
        
        return ml
    }()
    
    
    @objc func loginBtnClick(){
        

        delegate?.loginBtnWillClick()
    }
    
    @objc func registerBtnClick(){
    
        
        delegate?.registerBtnWillClick()
    }
    
    private lazy var loginButton : UIButton = {
        
        let btn = UIButton()
        
        btn.setTitle("登录", for: .normal)
        
        btn.setTitleColor(UIColor.black, for: .normal)
        
//        var Btnbgimg = UIImage(named: "common_button_white_disable")
//        var w = Btnbgimg!.size.width * 0.5;
//        var h = Btnbgimg!.size.height * 0.5;
//        Btnbgimg = Btnbgimg!.resizableImage(withCapInsets: UIEdgeInsetsMake(h, w, h, w), resizingMode: .stretch)
        
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: .normal)
        
        btn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        
        
        
        return btn
        
    }()
    
    private lazy var registerButton : UIButton = {
        
        let btn = UIButton()
        
        btn.setTitle("注册", for: .normal)
        
        btn.setTitleColor(UIColor.orange, for: .normal)
        
//        var Btnbgimg = UIImage(named: "common_button_white_disable")
//        var w = Btnbgimg!.size.width * 0.5;
//        var h = Btnbgimg!.size.height * 0.5;
//        Btnbgimg = Btnbgimg!.resizableImage(withCapInsets: UIEdgeInsetsMake(h, w, h, w), resizingMode: .stretch)
        
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: .normal)
        
        btn.addTarget(self, action: #selector(registerBtnClick), for: .touchUpInside)
        
        return btn
        
    }()
    
}
