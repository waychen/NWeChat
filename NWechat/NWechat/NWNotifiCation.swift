//
//  NWNotifiCation.swift
//  NWechat
//
//  Created by 谌志伟 on 2017/7/13.
//  Copyright © 2017年 zhiwei.chen. All rights reserved.
//

import UIKit



/// 将工程中要用到的通知，放到这个文件下
class NWNotifiCation: NSObject {
    class var getSlidingCellBack:Notification{return initNotification(name: "GET_SLIDING_CELL_BACK")}
    
    
    
    
    
    
    /// 初始化Notification
    ///
    /// - Parameter name: Notification
    private class func initNotification(name:String)->Notification{
        return Notification.init(name: Notification.Name.init(rawValue: name))
    }
}
