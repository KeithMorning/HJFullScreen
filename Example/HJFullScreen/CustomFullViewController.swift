//
//  CustomFullViewController.swift
//  HJFullScreen_Example
//
//  Created by KeithXi on 2021/3/31.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import HJFullScreen

class CustomFullViewController: UIViewController,HJFullScreenAction {

    lazy var button:UIButton = {
        let button = UIButton()
        button.setTitle("exit", for: .normal)
        button.addTarget(self, action: #selector(exitFullScreen), for: .touchUpInside)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(button)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 20, y: 20, width: 100, height: 50)
    }
    
    func addTageToView(target: UIView) {
        self.view.addSubview(target)
        self.view.sendSubview(toBack: target)
    }
    
    @objc dynamic public func exitFullScreen(){
        self.dismiss(animated: true) {
            
        }
    }
    
    /// 必须写上横屏的方向
    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return [.landscapeRight,.landscapeLeft]
    }



}
