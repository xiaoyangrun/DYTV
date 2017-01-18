//
//  PageContentView.swift
//  DYTV
//
//  Created by xingen on 2017/1/18.
//  Copyright © 2017年 小羊快跑. All rights reserved.
//

import UIKit
class PageContentView: UIView {
    // MARK: - 定义属性
    fileprivate var childVC: [UIViewController]
    fileprivate var parentViewController: UIViewController
    // MARK: - 懒加载
    
    
    
    
    // MARK: - 自定义构造函数
    init(frame: CGRect, childVC: [UIViewController], parentViewController: UIViewController) {
        self.childVC = childVC
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
