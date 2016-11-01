//
//  TitleButton.swift
//  JXHWB
//
//  Created by niucai－ios on 16/11/1.
//  Copyright © 2016年 niucai－ios. All rights reserved.
//

import UIKit

class TitleButton: UIButton {
    
    // MARK: -重写init函数
    override init(frame: CGRect){
        
        super.init(frame: frame)
        
        setImage(UIImage(named: "navigationbar_arrow_down"), for: .normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), for: .selected)
        
        setTitleColor(UIColor.black, for: .normal)
        sizeToFit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = (titleLabel?.bounds.width)! + 5
    }
    
    
    
}
