//
//  UIBarButtonItem-Extension.swift
//  DYTV
//
//  Created by 小羊快跑 on 2017/1/11.
//  Copyright © 2017年 小羊快跑. All rights reserved.
//  扩展功能

import UIKit

extension UIBarButtonItem{
//    class func creatBarButtonItem(imageName: String, highImageName: String, size: CGSize) -> UIBarButtonItem {
//        let btn = UIButton()
//        btn.setImage(UIImage(named: imageName), for: .normal)
//        btn.setImage(UIImage(named: highImageName), for: .highlighted)
//        btn.frame = CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: size)
////        btn.addTarget(self, action: #selector(leftItemClick), for: .touchUpInside)
//        return UIBarButtonItem.init(customView: btn)
//    }
    
    ///便利构造函数
//    必须明确调用一个设计的构造函数, 用self调用
    convenience init(imageName: String, highImageName: String = "", size: CGSize = CGSize.init(width: 0, height: 0), target: AnyObject, action: Selector) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        if size != CGSize.init(width: 0, height: 0){
            btn.frame = CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: size)
        }
        btn.addTarget(target, action: action, for: .touchUpInside)
        self.init(customView: btn)
    }
}
