//
//  PopoverViewController.swift
//  DS11WB
//
//  Created by xiaomage on 16/4/5.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
