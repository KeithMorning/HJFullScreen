//
//  HJFullAnimator.swift
//  ViewControllerLab
//
//  Created by KeithXi on 2021/3/30.
//

import UIKit


/// refer: https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/CustomizingtheTransitionAnimations.html#//apple_ref/doc/uid/TP40007457-CH16-SW1


class HJFullAnimator: NSObject,UIViewControllerAnimatedTransitioning {
    
    weak var targetParent:UIView?
    var target:UIView
    weak var fullViewAction:HJFullScreenAction?
    var duration:TimeInterval = 0.3
    
    init(target:UIView) {
        self.target = target
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        
        guard let fromVc = fromViewController, let toVC = toViewController else {
            transitionContext.completeTransition(false)
            return
        }
        
        var isShow = false
        if let presentedVC = fromVc.presentedViewController,presentedVC == toVC {
            isShow = true
        }
        
        if isShow {
            self.animateShowFullScreen(using: transitionContext)
        }else{
            self.animateDismissFullScreen(using: transitionContext)
        }
    }
    
    func animationEnded(_ transitionCompleted: Bool) {
        
    }
    
    
    func animateShowFullScreen(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let targetParent = self.targetParent else {
            transitionContext.completeTransition(false)
            return
        }
        
        let atoView = transitionContext.view(forKey: .to)
        let atoVc = transitionContext.viewController(forKey: .to)
        
        
        guard let toview = atoView,let toVc = atoVc  else {
            transitionContext.completeTransition(false)
           return
        }
        
        let orignalFrame = transitionContext.containerView.convert(targetParent.bounds, from: targetParent)
        
        toview.bounds = targetParent.bounds
        toview.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2 * -1))
        toview.center = CGPoint(x: orignalFrame.midX, y: orignalFrame.midY)
        
        transitionContext.containerView.addSubview(toview)
        target.frame = toview.bounds
        
        if let fullViewAction = self.fullViewAction {
            fullViewAction.addTageToView(target: target)
        }else{
            toview.addSubview(target)
        }
        
        let finalFrame = transitionContext.finalFrame(for: toVc)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .layoutSubviews) {
            toview.transform = CGAffineTransform.identity
            toview.frame = finalFrame
            self.target.frame = toview.bounds
        } completion: { (susccess) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

    }
    
    func animateDismissFullScreen(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let targetParent = self.targetParent else {
            transitionContext.completeTransition(false)
            return
        }
        
        let orignalFrame = transitionContext.containerView.convert(targetParent.bounds, from: targetParent)
        
        let aFromView = transitionContext.view(forKey: .from)
        
        guard let fromView = aFromView else {
            transitionContext.completeTransition(true)
            return
        }
        
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0, options: .layoutSubviews) {
            
            fromView.transform = CGAffineTransform.identity
            fromView.frame = orignalFrame
            self.target.frame = fromView.bounds
            
        } completion: { (success) in
            targetParent.addSubview(self.target)
            fromView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

    }


}
