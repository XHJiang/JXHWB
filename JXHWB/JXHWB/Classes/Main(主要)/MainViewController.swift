//
//  MainViewController.swift
//  DSWB
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    // MARK: -懒加载创建中间加号按钮
    private lazy var composeBtn : UIButton = UIButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 添加所有控制器
        addAllController()
        
        // 添加加好按钮
        setupComposeBtn()
        
    }
    
    // MARK: -添加加号按钮
    private func setupComposeBtn() {

        // 添加子控件
        tabBar.addSubview(composeBtn)
        // 设置位置
        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
        XHLog(message: composeBtn.frame)
        
        // 添加事件
        composeBtn.addTarget(self, action: #selector(composeBtnClick), for: .touchUpInside)
    }

    // MARK: -添加所有控制器
    private func addAllController() {
        addChildViewController(childVc: HomeViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(childVc: MessageViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(childVc: NullViewController(), title: "", imageName: "")
        addChildViewController(childVc: DiscoverViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(childVc: ProfileViewController(), title: "我", imageName: "tabbar_profile")
    }
    
    // MARK:- 添加子控制器
    private func addChildViewController(childVc: UIViewController, title : String, imageName : String) {
        // 添加子控制器
        // 1.设置子控件的属性
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: imageName)
        childVc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        // 2.包装导航控制器
        let childNav = UINavigationController(rootViewController: childVc)
        
        // 3.添加到自控制器数组中
        addChildViewController(childNav)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for i in 0..<tabBar.items!.count {
            // 获取item
            let item = tabBar.items![i]
            // 如果是下标为2.禁止点击
            if i == 2 {
                item.isEnabled = false;
                continue
            }
        }
        
    }
    
}

// MARK: -事件监听
extension MainViewController {
    @objc fileprivate func composeBtnClick() {
        XHLog(message: "composeBtnClick")
    }
}
