//
//  UIImage+Extiontion.swift
//  NWechat
//
//  Created by 谌志伟 on 2017/9/14.
//  Copyright © 2017年 谌志伟. All rights reserved.
//

import Foundation
import UIKit
extension UIImage{
    //make image with color
    static func initWith(color:UIColor)->UIImage?{
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        if let context = UIGraphicsGetCurrentContext(){
            context.setFillColor(color.cgColor)
            context.fill(rect)
            let img = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return img
        }
        UIGraphicsEndImageContext()
        return nil
    }
    
    //change image's tint color
    func changeTintColor(with color:UIColor)->UIImage?{
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        if let context = UIGraphicsGetCurrentContext(){
            context.ctm.translatedBy(x: 0, y: self.size.height)
            context.setBlendMode(.normal)
            let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
            context.clip(to: rect, mask: self.cgImage!)
            context.setFillColor(color.cgColor)
            context.fill(rect)
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return newImage
        }
        UIGraphicsEndImageContext()
        return nil
    }
    
    //stretch  image
    //对图片进行拉伸
    func stretch(top:CGFloat,left:CGFloat,bottom:CGFloat,right:CGFloat)->UIImage?{
        let insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self.resizableImage(withCapInsets: insets, resizingMode: .stretch)
    }
    
    
}
