//
//  UIColor+customInit.swift
//  NWechat
//
//  Created by 谌志伟 on 2017/9/14.
//  Copyright © 2017年 谌志伟. All rights reserved.
//

import UIKit
import Foundation
extension UIColor{
//    make color with hex string
    static func initWith(hexText:String)->UIColor{
        var cString = hexText.trim().uppercased()
        if cString.hasPrefix("#"){
            cString = cString.subString(from: 1)
        }
        let getFloat = { (value:Float) -> CGFloat in
            return CGFloat(value/255)
        
        }
        let red = cString[0..<2]     //subString(from: 0, to: 2)
        let green = cString[2..<4]//.subString(from: 2, to: 4)
        let blue = cString[4..<6]
        var r:Float = 0 ,g:Float = 0 ,b:Float = 0
        
        Scanner(string: red).scanHexFloat(&r)
        Scanner(string: green).scanHexFloat(&g)
        Scanner(string: blue).scanHexFloat(&b)
        return UIColor.init(red: getFloat(r), green: getFloat(g), blue: getFloat(b), alpha: 1)
    }
}
