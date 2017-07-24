//
//  UIViewController+Extension.swift
//  NWechat
//
//  Created by 谌志伟 on 2017/7/24.
//  Copyright © 2017年 谌志伟. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    //给带有xib的累建立一个通用的初始化方法
    class func n_initFromNib()->UIViewController{
        let nib = Bundle.main.path(forResource: self.className, ofType: "nib")
        guard nib != nil else {
            assert(nib == nil, "invalid paramter")
            return UIViewController()
        }
        return self.init(nibName:self.className, bundle:nil)
    }
}
