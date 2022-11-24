//
//  SlidingWindow.swift
//  Algo
//
//  Created by ColaBean on 2022/11/23.
//  Copyright © 2022 OrganizationX. All rights reserved.
//

import Foundation

class SlidingWindow {}

extension String {
    func toArray() -> [Element]{
        return Array(self)
    }
}

extension SlidingWindow {
    // 最小覆盖子串
    // @see https://leetcode.cn/problems/minimum-window-substring/
    class Solution {
        func minWindow(_ s: String, _ t: String) -> String {
            let sArr = s.toArray()
            
            var need = [Character: Int]()
            var window = [Character: Int]()
            for c in t {
                need[c, default: 0] += 1
            }
            
            var left = 0, right = 0
            var valid = 0
            // 记录最小覆盖子串的起始索引及长度
            var start = 0, len = Int.max
            while right < sArr.count {
                // c 是将移入窗口的字符
                let c = sArr[right]
                // 扩大窗口
                right += 1
                // 进行窗口内数据的一系列更新
                if need.keys.contains(c) {
                    window[c, default: 0] += 1
                    if window[c] == need[c] {
                        valid += 1
                    }
                }
                // 判断左侧窗口是否收缩
                while valid == need.count {
                    // 在这里更新最小覆盖子串
                    if right - left < len {
                        start = left
                        len = right - left
                    }
                    // d 是将移除窗口的字符
                    let d = sArr[left]
                    // 缩小窗口
                    left += 1
                    // 进行窗口内数据的一系列更新
                    if need.keys.contains(d) {
                        if window[d] == need[d] {
                            valid -= 1
                        }
                        window[d]! -= 1
                    }
                }
            }
            // 另一种截取字符串写法
//            let upperBound = s.index(s.startIndex, offsetBy: start)
//            let lowerBound = s.index(upperBound, offsetBy: len)
//            let r = s[upperBound..<lowerBound]
//            let rr = String(r)
            return len == Int.max ? "" : String(sArr[start..<start+len])
        }
        
        func minWindowV2(_ s: String, _ t: String) -> String {
            var need = [Character: Int]() // 统计t中字符出现的个数
            var window = [Character: Int]() // 统计窗口中的相应字符出现的次数
            for c in t { need[c, default: 0] += 1 }
            
            var left = 0, right = 0
            var valid = 0 // 窗口内有效字符个数与t相等时，形成窗口
            
            // 最短字符范围
            var start = 0, len = Int.max
            while right < s.count {
                // 取字符
                let tailIndex = s.index(s.startIndex, offsetBy: right)
                let pushChar = s[tailIndex]
                
                right += 1
                if need.keys.contains(pushChar) {
                    window[pushChar, default: 0] += 1
                    if window[pushChar] == need[pushChar] {
                        valid += 1
                    }
                }
                
                while valid == need.count {
                    // 记录最短长度
                    if right - left < len {
                        start = left
                        len = right - left
                    }
                    
                    let headIndex = s.index(s.startIndex, offsetBy: left)
                    let popChar = s[headIndex]
                    
                    left += 1
                    if need.keys.contains(popChar) {
                        if window[popChar] == need[popChar] {
                            valid -= 1
                        }
                        window[popChar]! -= 1
                    }
                }
            }
            
            let upperBound = s.index(s.startIndex, offsetBy: start)
            let lowerBound = s.index(upperBound, offsetBy: len)
            return len == Int.max ? "" : String(s[upperBound..<lowerBound])
        }
    }
}
