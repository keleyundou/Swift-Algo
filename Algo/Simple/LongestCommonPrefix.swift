// Copyright © 2019 OrganizationX.
// All rights reserved.
/**********************************************************\
 * PROJECTNAME:  Algo
 * FILENAME:     LongestCommonPrefix.swift
 * AUTHER:       ColaBean
 * CREATE TIME:  2019/1/15
 * MODIFY TIME:
 * DES: https://leetcode-cn.com/problems/longest-common-prefix/solution/
 \**********************************************************/
//

import Foundation

class LongestCommonPrefix {
    
//    LCP(S1 ... Sn)
    class func longestCommonPrefix(_ strs: [String]) -> String {
        let app = LongestCommonPrefix()
        return app.method4(strs: strs)
    }
    
    //MARK: >>>水平扫描法
    func method1(strs: [String]) -> String {
        guard strs.count != 0 else {
            return ""
        }
        var prefix = strs.first!
        
        for str in strs {
            while !str.hasPrefix(prefix) {
                prefix = String(prefix.prefix(prefix.count-1))
                if prefix.isEmpty {
                    return ""
                }
            }
        }
        return prefix
    }
    
    //MARK: >>>水平扫描
    /*
     flower
     flow
     flight
     
     按列比较字符，直到字符不相同结束
     */
    func method2(strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }
        
        let firstObjct = strs.first!
        for i in firstObjct.indices {
            let c = firstObjct[i]
            
            for j in 1..<strs.count {
                //strs[j].index(strs[j].startIndex, offsetBy: i.encodedOffset)
                if i.encodedOffset == strs[j].count || strs[j][i] != c{
                    return String(firstObjct.prefix(i.encodedOffset))
                }
            }
        }
        return firstObjct
    }
    
    //MARK: >>>分治
    func method3(strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }
        return longestCommonPrefix(strs: strs, l: 0, r: strs.count-1)
    }
    
    func longestCommonPrefix(strs: [String], l left: Int, r right: Int) -> String {
        if left == right {
            return strs[left]
        }
        let mid = (left + right) / 2
        let lcpLeft = longestCommonPrefix(strs: strs, l: left, r: mid)
        let lcpRight = longestCommonPrefix(strs: strs, l: mid+1, r: right)
        
        return commonPrefix(left: lcpLeft, right: lcpRight)
    }
    
    func commonPrefix(left: String, right: String) -> String {
        let minLen = min(left.count, right.count)
        
//        for index in 0..<minLen {
//            //String
//            let lv = left.index(left.startIndex, offsetBy: index)
//            let rv = right.index(right.startIndex, offsetBy: index)
//            guard left[lv] == right[rv] else {
//                return String(left.prefix(index))
//            }
//        }
//        return String(left.prefix(minLen))
        
//        let l = NSString(string: left)
//        let r = NSString(string: right)
        
        let l = left as NSString
        let r = right as NSString
        
        for index in 0..<minLen {
            guard l.character(at: index) == r.character(at: index) else {
                return l.substring(to: index)
            }
        }
        return l.substring(to: minLen)
    }
    
    //MARK: >>>二分查找法
    func method4(strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }
        
        var minLen = Int.max
        for item in strs {
            minLen = min(minLen, item.count)
        }
        
        var low = 1
        var high = minLen
        while low < high {
            let mid = (low + high) / 2
            
            if isCommonPrefix(strs: strs, len: mid) {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return String(strs.first!.prefix((low + high) / 2))
    }
    
    func isCommonPrefix(strs: [String], len: Int) -> Bool {
        
        let prefix = String(strs.first!.prefix(len))
        
        for item in strs {
            guard item.hasPrefix(prefix) else {
                return false
            }
        }
        return true
    }
    
}
