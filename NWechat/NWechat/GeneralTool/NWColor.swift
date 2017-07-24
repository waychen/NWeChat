//
//  NWColor.swift
//  NWechat
//
//  Created by 谌志伟 on 2017/7/24.
//  Copyright © 2017年 谌志伟. All rights reserved.
//

import Foundation

import UIKit
class NWColors: NSObject {
    //白色
    class var white:UIColor{
        get{
            return UIColor.white
        }
    }
    
    
    //导航栏颜色
    class var navBarColor:UIColor{
        get{
            return UIColor.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        }
    }
    
    //淡灰色。主要用于tableView的backgroundColor
    class var ulightGray:UIColor{
        get{
            return UIColor(red: 0xf6/0xff, green: 0xf6/0xff, blue: 0xf6/0xff, alpha: 1.0)
        }
    }
    
    
}
