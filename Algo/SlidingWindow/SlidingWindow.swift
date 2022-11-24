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
    class Solution {
        // 76. 最小覆盖子串
        // @see https://leetcode.cn/problems/minimum-window-substring/
        func minWindow(_ s: String, _ t: String) -> String {
            let sArr = s.toArray()
            
            let need = t.reduce(into: [Character:Int]()){ $0[$1, default: 0] += 1 }
            var window = [Character: Int]()
            
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
        
        // 太耗时
        func minWindowV2(_ s: String, _ t: String) -> String {
            let need = t.reduce(into: [Character:Int]()) { $0[$1, default: 0] += 1} // 统计t中字符出现的个数
            var window = [Character: Int]() // 统计窗口中的相应字符出现的次数
            
            var left = 0, right = 0
            var valid = 0 // 窗口内有效字符个数与t相等时，形成窗口
            
            // 最短字符范围
            var start = 0, len = Int.max
            while right < s.count {
                // 取字符
                let tailIndex = s.index(s.startIndex, offsetBy: right)// Complexity: O(n)
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
            
            guard len != Int.max else { return "" }
            let upperBound = s.index(s.startIndex, offsetBy: start)
            let lowerBound = s.index(upperBound, offsetBy: len)
            return String(s[upperBound..<lowerBound])
        }
        
        // 567. 字符串的排列
        // @see https://leetcode.cn/problems/permutation-in-string/
        func checkInclusion(_ s1: String, _ s2: String) -> Bool {
            let sArr = Array(s2)
            let need = s1.reduce(into: [Character:Int]()) { $0[$1, default: 0] += 1 }
            var window = [Character: Int]()
            
            var left = 0, right = 0
            var valid = 0
            while right < sArr.count {
                let c = sArr[right]
                right += 1
                if need.keys.contains(c) {
                    window[c, default: 0] += 1
                    if window[c] == need[c] {
                        valid += 1
                    }
                }
                
                while right - left >= s1.count {
                    if valid == need.count {
                        return true
                    }
                    let d = sArr[left]
                    left += 1
                    if need.keys.contains(d) {
                        if window[d] == need[d] {
                            valid -= 1
                        }
                        window[d]! -= 1
                    }
                }
            }
            return false
        }
        
        // 438. 找到字符串中所有字母异位词
        // @see https://leetcode.cn/problems/find-all-anagrams-in-a-string/
        func findAnagrams(_ s: String, _ p: String) -> [Int] {
            var res = [Int]()
            let sArr = Array(s)
            let need = p.reduce(into: [Character:Int]()){ $0[$1, default: 0] += 1 }
            var window = [Character:Int]()
            var left = 0, right = 0
            var valid = 0
            
            while right < sArr.count {
                let c = sArr[right]
                right += 1
                if need.keys.contains(c) {
                    window[c, default: 0] += 1
                    if window[c] == need[c] {
                        valid += 1
                    }
                }
                
                while right - left >= p.count {
                    if valid == need.count {
                        res.append(left)
                    }
                    let d = sArr[left]
                    left += 1
                    if need.keys.contains(d) {
                        if window[d] == need[d] {
                            valid -= 1
                        }
                        window[d]! -= 1
                    }
                }
            }
            return res
        }
    }
}
