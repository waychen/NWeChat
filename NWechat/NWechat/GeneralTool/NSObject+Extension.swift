//
//  NSObject+Extension.swift
//  NWechat
//
//  Created by 谌志伟 on 2017/7/24.
//  Copyright © 2017年 谌志伟. All rights reserved.
//

import Foundation
import UIKit
extension NSObject{
    //获取类名
    class var className:String{
        return NSStringFromClass(self).components(separatedBy: ".").last! as String
    }
    
    class var n_identifier:String{
        return className + "_identifier"
    }
}
