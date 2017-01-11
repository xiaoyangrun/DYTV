//
//  MainViewController.swift
//  DYTV
//
//  Created by 小羊快跑 on 2017/1/11.
//  Copyright © 2017年 小羊快跑. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVcWithStoryboardName(name: "Home")
        addChildVcWithStoryboardName(name: "Live")
        addChildVcWithStoryboardName(name: "Follow")
        addChildVcWithStoryboardName(name: "Profile")
    }
}

// MARK: - 添加子控制器
extension MainViewController {
    func addChildVcWithStoryboardName(name: String) {
        let childVC = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()
        addChildViewController(childVC!)
    }
}
