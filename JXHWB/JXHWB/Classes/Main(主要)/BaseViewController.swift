//
//  BaseViewController.swift
//  JXHWB
//
//  Created by niucai－ios on 16/11/1.
//  Copyright © 2016年 niucai－ios. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: -懒加载属性
    lazy var visitorView : VisitorView = VisitorView.visitorView()
    
    // MARK: -定义变量
    var isLogin : Bool = true
    
    // MARK: -系统回调函数
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavgationItems()
        
    }
}

// MARK: -设置UI内容
extension BaseViewController {
    fileprivate func setupVisitorView() {
        view = visitorView
        
        // 监听内部注册和登录按钮点击
        visitorView.registerBtn.addTarget(self, action: #selector(registerBtnClick), for: .touchUpInside)
        visitorView.loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
    }
    
    // 设置导航栏左右两边
    fileprivate func setupNavgationItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(registerBtnClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(loginBtnClick))
    }
}

// MARK:- 事件监听
extension BaseViewController {
    @objc fileprivate func registerBtnClick() {
        XHLog(message: "registerBtnClick")
    }
    
    @objc fileprivate func loginBtnClick() {
        XHLog(message: "loginBtnClick")
    }
}

