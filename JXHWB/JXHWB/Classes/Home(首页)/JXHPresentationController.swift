//
//  JXHPresentationController.swift
//  JXHWB
//
//  Created by niucai－ios on 16/11/2.
//  Copyright © 2016年 niucai－ios. All rights reserved.
//

import UIKit

class JXHPresentationController: UIPresentationController {

    fileprivate lazy var coverView : UIView = UIView()
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        // 设置弹出View的尺寸
        presentedView!.frame = CGRect(x: 100, y: 50, width: 180, height: 250)
        
        // 添加蒙版
        setupCoverView()
    }
    
    
}

extension JXHPresentationController {
    fileprivate func setupCoverView() {
        // 1.添加蒙版
        containerView!.insertSubview(coverView, at: 0)
        
        // 2.设置蒙版属性
        coverView.backgroundColor = UIColor(white: 1, alpha: 0.2)
        
        coverView.frame = containerView!.bounds
        
        // 3.添加手势,点击移除
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(removeCover))
        
        coverView.addGestureRecognizer(tapGes)
    }
}

// MARK: -事件监听
extension JXHPresentationController {
    @objc fileprivate func removeCover() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}



