//
//  HomeViewController.swift
//  DSWB
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: -懒加载属性
    fileprivate lazy var titleBtn : TitleButton = TitleButton()
    
    // MARK: -系统毁掉函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.没有登录时设置的内容
        if !isLogin {
            visitorView.addRotationAnim()
            
            return
        }
        
        // 2.设置导航栏的内容
        setupNavigationBar()
        
    }

}

// MARK: -设置UI布局
extension HomeViewController {
    fileprivate func setupNavigationBar() {
        // 1.设置左侧的item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
        // 2.设置titleView
        titleBtn.setTitle("coderwhy", for: UIControlState())
        titleBtn.addTarget(self, action: #selector(titleBtnClick(titleBtn:)), for: .touchUpInside)
        navigationItem.titleView = titleBtn
    }
}

// MARK: -事件处理
extension HomeViewController {
    @objc fileprivate func titleBtnClick(titleBtn : TitleButton) {
        // 1.改变按钮状态
        titleBtn.isSelected = !titleBtn.isSelected
        
        // 2.创建弹出的控制器
        let popoverVc = PopoverViewController()
        
        // 3.设置控制器的model样式
        popoverVc.modalPresentationStyle = .custom;
        
        // 4.弹出控制器
        present(popoverVc, animated: true, completion: nil)
    }
}
























