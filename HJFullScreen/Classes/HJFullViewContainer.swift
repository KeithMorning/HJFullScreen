//
//  HJFullViewController.swift
//  ViewControllerLab
//
//  Created by KeithXi on 2021/3/30.
//

import UIKit


public typealias FullScreenType = UIViewController & HJFullScreenAction

public protocol HJFullScreenAction:class {
    func addTageToView(target:UIView)
}

public class HJFullViewContainer: UIView {
    
    var target:UIView
    var duration:TimeInterval // fullScreen animation duration
    
    private lazy var fullScreenAnimator:HJFullAnimator = {
        let animator = HJFullAnimator(target: self.target)
        return animator
    }()
    
    public init(content:UIView,duration:TimeInterval = 0.3){
        self.target = content
        self.duration = duration
        super.init(frame: .zero)
        self.addSubview(content)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if target.superview == self {
            target.frame = self.bounds
        }
        
    }

    public func fullScreen(fullScreenVc:FullScreenType,complete:(()->Void)?) {
        
        AssertFullScreenVcOrientation(fullScreenVc)
        
        let aParentVc = self.findViewController()
        guard let parentVc = aParentVc  else {
            return
        }
        
        fullScreenVc.transitioningDelegate = self
        fullScreenVc.modalPresentationStyle = .overFullScreen
        fullScreenVc.modalPresentationCapturesStatusBarAppearance = true
        
        self.fullScreenAnimator.targetParent = self
        self.fullScreenAnimator.fullViewAction = fullScreenVc
        self.fullScreenAnimator.duration = duration
        
        parentVc.present(fullScreenVc, animated: true, completion: complete)
    }
    
    func AssertFullScreenVcOrientation(_ fullScreenVc:FullScreenType) {
        
        if fullScreenVc.supportedInterfaceOrientations.contains(.portrait) || fullScreenVc.supportedInterfaceOrientations.contains(.portraitUpsideDown){
            
            fatalError("The fullScreenVC only support landscapeLeft and landscapeRight")
        }
        
        
        
    }
    
    
}

extension HJFullViewContainer:UIViewControllerTransitioningDelegate{
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.fullScreenAnimator
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.fullScreenAnimator
    }
}

extension HJFullViewContainer {
    
    func findViewController() -> UIViewController? {
        var next = self.next
        while next != nil {
            if next!.isKind(of: UIViewController.self) {
                break
            }else{
                next = next?.next
            }
        }
        
        if let vc = next {
            return (vc as! UIViewController)
        }else {
            return nil
        }
    }
}

