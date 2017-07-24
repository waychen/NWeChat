//
//  AppDelegate.swift
//  NWechat
//
//  Created by 谌志伟 on 2017/7/12.
//  Copyright © 2017年 zhiwei.chen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = NWColors.white
        setupTabbar()
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

//MARK:--- 设置界面，tabBar
extension AppDelegate{
    fileprivate func setupTabbar(){
        let tabbar = NWTabBarController()
        
        
        let msgVC = NWMsgTableVC()
        
        msgVC.tabBarItem.title = "信息"
        msgVC.tabBarItem.image = #imageLiteral(resourceName: "tabbar_mainframe")
        msgVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabbar_mainframeHL")
        msgVC.title = "我的信息"
        let messege = NWNavBarController(rootViewController: msgVC)
        
        let adressList = NWAdressListTableVC()
        
        adressList.tabBarItem.title = "通讯录"
        adressList.tabBarItem.image = #imageLiteral(resourceName: "tabbar_contacts")
        adressList.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabbar_contactsHL")
        adressList.title = "通讯录"
        let adress = NWNavBarController(rootViewController: adressList)
        
        let discoverryVC = NWDiscoverTableVC()
        discoverryVC.tabBarItem.title = "发现"
        discoverryVC.title = "发现"
        discoverryVC.tabBarItem.image = #imageLiteral(resourceName: "tabbar_discover")
        discoverryVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabbar_discoverHL")
        let discovery = NWNavBarController(rootViewController: discoverryVC)
        
        let profileVC = NWProfileTableVC()
        profileVC.tabBarItem.title = "我"
        profileVC.title = "我"
        profileVC.tabBarItem.image = #imageLiteral(resourceName: "tabbar_me")
        profileVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabbar_meHL")
        let profile = NWNavBarController(rootViewController: profileVC)
        
        tabbar.viewControllers = [messege,adress,discovery,profile]
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        window?.rootViewController = tabbar
    
    
    }
    




}

