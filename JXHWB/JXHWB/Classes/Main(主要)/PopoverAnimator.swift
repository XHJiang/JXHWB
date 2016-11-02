//
//  PopoverAnimator.swift
//  JXHWB
//
//  Created by niucai－ios on 16/11/2.
//  Copyright © 2016年 niucai－ios. All rights reserved.
//

import UIKit

class PopoverAnimator: NSObject {
    // MARK: -记录是弹出动画还是消失动画
    var isPresented : Bool = true
    // MARK: -自定义动画时长
    let timeInterval : Float = 0.5
    
    // 按钮的状态
    var callBack : ((_ presented : Bool) -> ())?
    
    // 如果自定义了一个构造函数,但是没有对默认构造函数init()进行重写,那么自定义的构造函数会覆盖默认的init()构造函数
    init(callBack : @escaping (_ presented : Bool) -> ()) {
        self.callBack = callBack
    }
    
}


extension PopoverAnimator : UIViewControllerTransitioningDelegate {
    // 重写推出方法,自定义弹出View尺寸并添加蒙板
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?  {
        return JXHPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    // 自定义弹出动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        callBack!(isPresented)
//        titleBtn.isSelected = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        callBack!(isPresented)
//        titleBtn.isSelected = false
        return self
    }
    
    
}


// MARK: -弹出和消失动画的代理
extension PopoverAnimator : UIViewControllerAnimatedTransitioning {
    
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
