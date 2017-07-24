//
//  NWHelper.swift
//  NWechat
//
//  Created by 谌志伟 on 2017/7/13.
//  Copyright © 2017年 zhiwei.chen. All rights reserved.
//

import UIKit



class NWHelper: NSObject {
    
   
    
    class func getSlidingCellBack(){
        NotificationCenter.default.post(NWNotifiCation.getSlidingCellBack)
    }
    

}
