//
//  MessageViewController.swift
//  DSWB
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !isLogin {
            visitorView.setupVisitorViewInfo(iconName: "visitordiscover_image_message", title: "登录后，别人评论你的微博，给你发消息，都会在这里收到通知")
            return
        }
        
    }

}
