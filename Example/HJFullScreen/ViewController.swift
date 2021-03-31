//
//  ViewController.swift
//  HJFullScreen
//
//  Created by keithmorning on 03/31/2021.
//  Copyright (c) 2021 keithmorning. All rights reserved.
//

import UIKit
import HJFullScreen

class ViewController: UIViewController {
    
    lazy var contentImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "cover"))
        imageView.addSubview(self.lineView)
        
        self.lineView.translatesAutoresizingMaskIntoConstraints = false
        let layoutConstraints = [
            self.lineView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20),
            self.lineView.heightAnchor.constraint(equalToConstant: 3),
            self.lineView.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            self.lineView.rightAnchor.constraint(equalTo: imageView.rightAnchor)
        ]
        NSLayoutConstraint.activate(layoutConstraints)
        
        return imageView
    }()
    
    lazy var lineView:UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var contentView:HJFullViewContainer = {
        let view = HJFullViewContainer(content: self.contentImageView)
        return view
    }()


    lazy var fullButton:UIButton = {
        let button = UIButton()
        button.setTitle("full", for: .normal)
        button.addTarget(self, action: #selector(fullScreen(button:)), for: .touchUpInside)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    
    @objc func fullScreen(button:UIButton) {
        
        let fullscreenVc = CustomFullViewController()
        self.contentView.fullScreen(fullScreenVc: fullscreenVc) {
            
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.contentView)
        self.view.addSubview(self.fullButton)
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.fullButton.translatesAutoresizingMaskIntoConstraints = false
        
        let layoutConstraints = [
            self.contentView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.contentView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.contentView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.contentView.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 9.0/16, constant: 0),
    
            self.fullButton.topAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 20),
            self.fullButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(layoutConstraints)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}


