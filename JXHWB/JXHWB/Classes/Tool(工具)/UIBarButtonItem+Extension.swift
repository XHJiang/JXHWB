//
//  UIBarButtonItem+Extension.swift
//  JXHWB
//
//  Created by niucai－ios on 16/11/1.
//  Copyright © 2016年 niucai－ios. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(imageName : String) {
        
        self.init()
        
        let btn = UIButton()
        btn.setImage(UIImage(named : imageName), for: .normal);
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        
        self.customView = btn
    }
    
}
