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
    }
}
