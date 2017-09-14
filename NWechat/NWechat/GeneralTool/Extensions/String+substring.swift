//
//  String+substring.swift
//  NWechat
//
//  Created by 谌志伟 on 2017/9/14.
//  Copyright © 2017年 谌志伟. All rights reserved.
//

import Foundation
extension String{
    
    //remove white space frome string
    func trim()->String{
        return self.trimmingCharacters(in: .whitespaces)
    }
    //通过下标范围来取。   
    // example  let a = "Iamahandsoneboy" b=a[3..<a.character.count]  //b="handsone"
    subscript (r:Range<Int>)->String {
        get {
            guard r.count < self.characters.count else {return ""}
            let startIdx = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIdx = self.index(self.startIndex, offsetBy: r.upperBound)
            return self[startIdx..<endIdx]
        }
    }
    
    //通过XML节点，取XML数据
    //example let a = "<name>wayChen</name>" b = a["name"] // b == wayChen
    subscript (xmlNod:String)->String{
        let startNod = "<\(xmlNod)>"
        let endNod = "/\(xmlNod)"
        return self[(startNod,endNod)]
    }
    
    //get substring by turple 
    //example a = " I am a handsone boy" b = a[("a","boy")] b = "handsone"
    subscript (string:(startString:String,endString:String))->String{
        return self.subString(from:string.startString , to: string.endString)
    }
    
    func subString(from index:Int)->String{
        guard index < self.characters.count - 1 else{return ""}
        
        return self[index..<self.characters.count]
    }
    
    /// 截取到某个index的子字符串
    ///
    /// - Parameter toIndex: 终点
    /// - Returns: 子字符串，如果，index > self.characters.count 返回空字符串
    func subString(toIndex:Int)->String{
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
    func subString(from:Int,to:Int)->String{
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
    func subString(from startSting:String,to endString:String)->String{
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
