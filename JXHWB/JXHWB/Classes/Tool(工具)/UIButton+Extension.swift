//
//  UIButton+Extension.swift
//  JXHWB
//
//  Created by niucai－ios on 16/11/1.
//  Copyright © 2016年 niucai－ios. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(imageName : String, bgImageName : String) {
        self.init()
        
        setImage(UIImage.init(named: imageName), for: .normal)
        setImage(UIImage(named : imageName + "_highlighted"), for: .highlighted)
        
        setBackgroundImage(UIImage(named : bgImageName), for: .normal)
        setBackgroundImage(UIImage(named : bgImageName  + "_highlighted"), for: .normal)
        
        sizeToFit()
    }
    
    
    
}
