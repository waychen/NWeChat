//
//  NWColors.swift
//  NWechat
//
//  Created by 谌志伟 on 2017/7/12.
//  Copyright © 2017年 zhiwei.chen. All rights reserved.
//

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
