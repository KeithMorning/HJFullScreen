//
//  HJFullContentViewController.swift
//  ViewControllerLab
//
//  Created by KeithXi on 2021/3/30.
//

import UIKit

public class HJFullContentViewController: UIViewController,HJFullScreenAction {

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    
    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return [.landscapeRight,.landscapeLeft]
    }
    
    public func addTageToView(target: UIView) {
        self.view.addSubview(target)
    }
    
    public override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
}


