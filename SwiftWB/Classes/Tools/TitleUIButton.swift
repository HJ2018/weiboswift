//
//  TitleUIButton.swift
//  SwiftWB
//
//  Created by jie.huang on 27/2/19.
//  Copyright © 2019年 MAITIAN. All rights reserved.
//

import Foundation
import UIKit

class TitleUIButton: UIButton {
    
    
    
    override init(frame: CGRect) {
        
        super .init(frame: frame)
        
        
        self.setTitleColor(UIColor.black, for: .normal)
        self.setImage(UIImage(named: "navigationbar_arrow_down"), for: .normal)
        self.setImage(UIImage(named: "navigationbar_arrow_up"), for: .selected)
        self.sizeToFit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.frame.origin.x = -imageView!.bounds.width
        imageView?.frame.origin.x = titleLabel!.bounds.width
        
//        titleLabel?.frame.origin.x = 0
//        imageView?.frame.origin.x = titleLabel!.bounds.width
        
    }
}
