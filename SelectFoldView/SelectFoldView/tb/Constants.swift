//
//  Constants.swift
//  ztdoa
//
//  Created by riven on 2020/10/15.
//  Copyright © 2020 riven. All rights reserved.
//

import UIKit
import Foundation


//MARK: ****** 字符串常量 ******
//MARK:存储token的key
let kUserAuthorization:String = "kUserAuthorization"
let kUserEncryptedAccessToken:String = "kUserEncryptedAccessToken"
//MARK:USERID
public let kCurrentUserId = "kCurrentUserId"

/// 应用信息
struct AppInfo {
    /// 版本号
    public static var Version:String{
        let infoDictionary = Bundle.main.infoDictionary
        if let infoDictionary = infoDictionary {
            return infoDictionary["CFBundleShortVersionString"] as! String
        }
        return " - "
    }
    /// Build
    public static var Build:String{
        let infoDictionary = Bundle.main.infoDictionary
        if let infoDictionary = infoDictionary {
            return infoDictionary["CFBundleVersion"] as! String
        }
        return " - "
    }
    
    /// 系统版本号
    public static var SystemVersion:String{
        return UIDevice.current.systemVersion
    }
    
    /// 系统名称
    public static var SystemName:String{
        return UIDevice.current.systemName
    }
    
    /// 设备型号
    public static var DeviceModel:String{
        return UIDevice.current.model
    }
}



//MARK:ScreenWidth
public let ScreenWidth:CGFloat = UIScreen.main.bounds.size.width

//MARK:ScreenHeight
public let ScreenHeight:CGFloat = UIScreen.main.bounds.size.height

//MARK: 缩放比例
let kScreenScale = ScreenWidth / 375


//MARK: key window
let key_window = UIApplication.shared.windows.first!

//MARK:个人中心 - 代办流程 已办流程 我的申请 详情列表section高度
public let MeDetailsListSectionHeight = 54.0




