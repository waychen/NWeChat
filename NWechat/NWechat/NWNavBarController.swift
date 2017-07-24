//
//  NWNavBarController.swift
//  NWechat
//
//  Created by 谌志伟 on 2017/7/12.
//  Copyright © 2017年 zhiwei.chen. All rights reserved.
//

import UIKit

class NWNavBarController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setbar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0{
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
    
    
    /// 设置屏幕
    
    private func setbar(){
 
        
        let bar = self.navigationBar
        bar.barTintColor = NWColors.navBarColor
        bar.tintColor = NWColors.white
        bar.titleTextAttributes = [NSForegroundColorAttributeName:NWColors.white]
        
    
    }
    

    override var shouldAutorotate: Bool {
        get{
            return false
        }
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get{
            return .portrait
        }
    }
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        get{
            return .portrait
        }
    }

}
