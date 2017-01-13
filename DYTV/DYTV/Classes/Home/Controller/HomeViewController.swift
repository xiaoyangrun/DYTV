//
//  HomeViewController.swift
//  DYTV
//
//  Created by 小羊快跑 on 2017/1/11.
//  Copyright © 2017年 小羊快跑. All rights reserved.
//

import UIKit

// MARK: - 系统回调函数
class HomeViewController: UIViewController {
    // MARK: - 懒加载属性
    //闭包创建
    private lazy var pageTitleView: PageTitleView = {
        let titleFrame = CGRect.init(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 44)
        let titles = ["推荐", "游戏", "娱乐", "去玩"];
        let titleView = PageTitleView.init(frame: titleFrame, titles: titles)
        titleView.backgroundColor = UIColor.green
        return titleView
    }()  //记得加上 ()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.addSubview(pageTitleView)
    }
}

// MARK: - 设置导航栏内容
extension HomeViewController{
    //设置导航设置导航栏内容
    func setupNavigationBar(){
        setupLeftNavigationBar()
        setupRightNavigationBar()
    }
    //设置左边
    func setupLeftNavigationBar(){
        let btn = UIButton()
        btn.setImage(UIImage(named: "logo"), for: .normal)
        btn.sizeToFit()
        btn.addTarget(self, action: #selector(leftItemClick), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: btn)
    }
    //设置右边
    func setupRightNavigationBar(){
        //0.确定uibutton的 尺寸
        let size = CGSize.init(width: 40, height: 44)
        //1.创建历史按钮
        let historyItem = UIBarButtonItem.init(imageName: "Image_my_history", highImageName: "Image_my_history_click", size: size, target: self, action: #selector(historyItemClick))
        //2.创建二维码按钮
        let qrCodeItem = UIBarButtonItem.init(imageName: "Image_scan", highImageName: "Image_scan_click", size: size, target: self, action: #selector(qrCodeItemClick))
        //3.创建搜索按钮
        let searchItem = UIBarButtonItem.init(imageName: "btn_search", highImageName: "btn_search_clicked", size: size, target: self, action: #selector(searchItemClick))
        
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrCodeItem]
    }
    
    // MARK: 导航栏的事件处理
     @objc private func leftItemClick() {
        print("点击了logo")
    }
    @objc private func qrCodeItemClick() {
        print("点击了二维码")
    }
    @objc private func searchItemClick() {
        print("点击了搜索")
    }
    @objc private func historyItemClick() {
        print("点击了历史")
    }
    
}
