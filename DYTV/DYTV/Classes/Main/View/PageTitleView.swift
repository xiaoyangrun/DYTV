//
//  PageTitleView.swift
//  DYTV
//
//  Created by 小羊快跑 on 2017/1/11.
//  Copyright © 2017年 小羊快跑. All rights reserved.
//

import UIKit

// MARK: - 定义常量
private let kScrollLineH : CGFloat = 2
private let kNomalColor: (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)





class PageTitleView: UIView {
    // MARK: - 定义属性
    fileprivate var currentIndex : Int = 0
    //显示所有标题
    fileprivate var titles: [String]
    //是否可以滚动
    fileprivate var isScrollEnable: Bool
    
    
    // MARK: - 懒加载
    fileprivate lazy var titleLabels: [UILabel] = [UILabel]()
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        return scrollView
    }()
    
    fileprivate lazy var scrollLine: UIView =  {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    
    // MARK: - 自定义构造函数
    init(frame: CGRect, titles: [String], isScrollEnable: Bool) {
        self.titles = titles
        self.isScrollEnable = isScrollEnable
        super.init(frame: frame)
        
        setupUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


// MARK: - 设置UI界面
extension PageTitleView{
    fileprivate func setupUI() {
        // 1.添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        //设置label
        setupTitleLabels()
        // 3.设置底线和滚动的滑块
        setupBottomLineAndScrollLine()
    }
    
    
    
    fileprivate func setupTitleLabels() {
        // 0.确定label的一些frame的值
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0
        for (index, title) in titles.enumerated() {
            //创建label
            let label = UILabel()
            //设置label的属性
            label.text = title
            
            label.tag = index
            
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.init(R: kNomalColor.0, G: kNomalColor.1, B: kNomalColor.2)
            label.textAlignment = .center
            //添加手势
            label.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(titleLabelOnClick(tap:)))
            label.addGestureRecognizer(tap)
            // 3.设置label的frame
            let labelX : CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            scrollView.addSubview(label)
            titleLabels.append(label)
            
        }
    }
    
    fileprivate func setupBottomLineAndScrollLine(){
        //添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.darkGray
        let lineH: CGFloat = 0.5
        bottomLine.frame = CGRect.init(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        //添加scrollLine
        //获取第一个label
        guard let firstLabel = titleLabels.first else { return }
        firstLabel.textColor = UIColor.init(R: kSelectColor.0, G: kSelectColor.1, B: kSelectColor.2)
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        scrollLine.frame = CGRect.init(x: firstLabel.frame.origin.x, y: frame.height-kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
        addSubview(scrollLine)
    }
}



// MARK: - 监听label的点击事件
extension PageTitleView{
    func titleLabelOnClick(tap: UITapGestureRecognizer) {
        //获取当前label
        
    }
}

















