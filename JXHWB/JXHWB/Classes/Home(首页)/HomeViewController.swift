//
//  HomeViewController.swift
//  DSWB
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: -自定义动画时长
    let timeInterval : Float = 0.5
    
    // MARK: -记录是弹出动画还是消失动画
    var isPresented : Bool = true
    
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
        
        /// 4.设置转场代理
        popoverVc.transitioningDelegate = self
        
        // 4.弹出控制器
        present(popoverVc, animated: true, completion: nil)
    }
}


extension HomeViewController : UIViewControllerTransitioningDelegate {
    // 重写推出方法,自定义弹出View尺寸并添加蒙板
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return JXHPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    // 自定义弹出动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        titleBtn.isSelected = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        titleBtn.isSelected = false
        return self
    }
    
    
}


// MARK: -弹出和消失动画的代理
extension HomeViewController : UIViewControllerAnimatedTransitioning {
    
    // 动画执行的时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(timeInterval)
    }
    
    // 自定义弹出动画
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // 根据isPresented来判断执行方法
        isPresented ? presentedAnimateTransition(transitionContext: transitionContext) : dismissAnimateTransition(transitionContext: transitionContext);
    }
    
    // 弹出动画
    func presentedAnimateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // 1.获取要弹出的View
        let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        // 2.将弹出的View添加到containerView中
        transitionContext.containerView.addSubview(presentedView!)
        
        // 3.执行动画
        // 更改原始值
        presentedView!.transform = CGAffineTransform(scaleX: 1, y: 0)
        // 设置锚点
        presentedView!.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        UIView.animate(withDuration: TimeInterval(timeInterval), animations: { () -> Void in
            presentedView!.transform = .identity
        }, completion: {(_) -> Void in
            
            // 必须告诉上下文,我执行完了
            transitionContext.completeTransition(true)
        })
    }
    
    // 消失动画
    func dismissAnimateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // 1.获取要弹出的View
        let dismissView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        // 2.将弹出的View添加到containerView中
        transitionContext.containerView.addSubview(dismissView!)
        
        // 3.执行动画
        UIView.animate(withDuration: TimeInterval(timeInterval), animations: { () -> Void in
            dismissView!.transform = CGAffineTransform(scaleX: 1.0, y: 0.0001)
        }, completion: {(_) -> Void in
            
            // 必须告诉上下文,我执行完了
            transitionContext.completeTransition(true)
        })
    }
    
}



















