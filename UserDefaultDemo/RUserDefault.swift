//
//  RUserDefault.swift
//  UserDefaultDemo
//
//  Created by JingZhao_R on 2019/9/26.
//  Copyright © 2019 JingZhao_R. All rights reserved.
//

import Foundation

/// 注意所有的属性需要 用@objc 标记
class RUserDefault: NSObject {
    
    static let shared = RUserDefault()
    
    /// 登录用户名, 退出登录或者token失效可以选择不清除
    @objc var userName: String {
        get {
            return UserDefaults.standard.string(forKey: "userName") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "userName")
        }
    }
    
    /// 登录状态
    @objc var isLogin: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isLogin")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isLogin")
        }
    }
    
    /// 用户基本信息
    @objc var userBaseInfo: [String: Any] {
        get {
            return UserDefaults.standard.dictionary(forKey: "userBaseInfo") ?? [:]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "userBaseInfo")
        }
    }
    
    /// 清空用户
    public func removeUser() {
        let prppertys = getPropertieNames(cls: RUserDefault.self)
        for property in prppertys {
            
            /// 不需要清除的在这里判断一下
            if property == "userName" {
                
            } else {
                /// 清空UserDefaultsz中对应的object
                UserDefaults.standard.removeObject(forKey: property)
            }
        }
    }
    
    /// 获取属性列表
    ///
    /// - Returns: [属性字符串列表]
    fileprivate func getPropertieNames(cls: AnyClass) -> [String] {
        
        var propertys:[String] = []
        
        var outCount:UInt32 = 0
        
        guard let peopers = class_copyPropertyList(cls, &outCount) else { return [] }
        
        let count:Int = Int(outCount);
        
        for i in 0...(count-1) {
            
            let aPro: objc_property_t = peopers[i]
            
            let proName = String(cString: property_getName(aPro))
            
            propertys.append(proName)
        }
        return propertys
    }
}

