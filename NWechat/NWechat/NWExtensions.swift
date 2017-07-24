//
//  NWExtensions.swift
//  NWechat
//
//  Created by 谌志伟 on 2017/7/12.
//  Copyright © 2017年 zhiwei.chen. All rights reserved.
//

//所有扩展，全部放在这个文件中



import Foundation


//MARK:-- String +
extension String{
    
    /// 截取到某个index的子字符串
    ///
    /// - Parameter toIndex: 终点
    /// - Returns: 子字符串，如果，index > self.characters.count 返回空字符串
    func getSubString(toIndex:Int)->String{
        if toIndex < self.characters.count{
            let index = self.index(self.startIndex, offsetBy: toIndex)
            return self.substring(to: index)
        }
        return ""
    }
    
    /// 截取一个范围的字符串
    ///
    /// - Parameters:
    ///   - from: 开始下标
    ///   - to: 结束下标
    /// - Returns: 截取的字符串
    func getSubString(from:Int,to:Int)->String{
        let count = self.characters.count
        guard count > from && to < count else{
            return ""
        }
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)
        guard startIndex < endIndex else {return ""}
        let rang = startIndex..<endIndex
        return self.substring(with: rang)
    }
    
    
    /// 截取两个字符串中间的字符串
    ///
    /// - Parameters:
    ///   - startSting: 开始的字符串
    ///   - endString: 结束字符串
    /// - Returns: 截取的字符串
    func getSubString(from startSting:String,to endString:String)->String{
        guard self.contains(startSting) && self.contains(endString) else {
            return ""
        }
        if let startIndex = self.range(of: startSting)?.upperBound , let endIndex = self.range(of: endString)?.lowerBound {
            guard endIndex > startIndex else{return ""}
            let rang = startIndex..<endIndex
            return self.substring(with: rang)
        }
        return ""
    
    }
    
    
}
