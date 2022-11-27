//
//  RandomizedSet.swift
//  Algo
//
//  Created by ColaBean on 2022/11/27.
//  Copyright © 2022 OrganizationX. All rights reserved.
//

import Foundation

// 380. O(1) 时间插入、删除和获取随机元素
// @see https://leetcode.cn/problems/insert-delete-getrandom-o1/
class RandomizedSet {
    var nums: [Int] = []
    var indexs = [Int:Int]()
    
    init() {
        
    }
    
    func insert(_ val: Int) -> Bool {
        if indexs.keys.contains(val) {
            return false
        }
        indexs[val] = nums.count
        nums.append(val)
        return true
    }

    func remove(_ val: Int) -> Bool {
        if !indexs.keys.contains(val) {
            return false
        }
        let i = indexs[val]!
        indexs[nums.last!] = i
        nums.swapAt(i, nums.count-1)
        nums.removeLast()
        indexs[val] = nil
        return true
    }

    func getRandom() -> Int {
        return nums[Int.random(in: 0..<nums.count)]
    }
}
