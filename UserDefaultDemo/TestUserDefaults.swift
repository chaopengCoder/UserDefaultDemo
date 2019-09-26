//
//  TestUserDefaults.swift
//  UserDefaultDemo
//
//  Created by JingZhao_R on 2019/9/26.
//  Copyright © 2019 JingZhao_R. All rights reserved.
//

import UIKit

class TestUserDefaults: UIViewController {
    
    fileprivate lazy var iSaveBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .white
        btn.frame = CGRect(x: 0, y: 100, width: 120, height: 50)
        btn.setTitle("存储", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        return btn
    }()
    
    fileprivate lazy var iClearBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .white
        btn.frame = CGRect(x: 0, y: 200, width: 120, height: 50)
        btn.setTitle("清除/退出登录", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.addTarget(self, action: #selector(clearAction), for: .touchUpInside)
        return btn
    }()
    
    fileprivate let userBaseInfo:[String :Any] = ["姓名": "张三",
    "电话": "187****1234",
    "性别": "未知",
    "年龄": 30,
    "婚否": false]
    
    /// 存储
    @objc fileprivate func saveAction() {
        RUserDefault.shared.isLogin = true
        RUserDefault.shared.userName = "用户名/手机号"
        RUserDefault.shared.userBaseInfo = userBaseInfo
        
        print("存储成功")
        print("沙盒路径=\(NSHomeDirectory())")
    }
    
    /// 清空UserDefaults
    @objc fileprivate func clearAction() {
        RUserDefault.shared.removeUser()
        print("清空成功")
        print("沙盒路径=\(NSHomeDirectory())")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        /// 获取存储的值
        print("登录状态: \(RUserDefault.shared.isLogin)")
        print("登录名/用户名: \(RUserDefault.shared.userName)")
        print("用户基本信息: \(RUserDefault.shared.userBaseInfo)")
    }
}

/// UI
extension TestUserDefaults {
    
    fileprivate func setupSubviews() {
        self.view.addSubview(iSaveBtn)
        self.view.addSubview(iClearBtn)
    }
}
