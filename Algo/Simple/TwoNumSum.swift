// Copyright © 2018年 OrganizationX.
// All rights reserved.
/**********************************************************\
 * PROJECTNAME:  Algo
 * FILENAME:     TwoNumSum.swift
 * AUTHER:       ColaBean
 * CREATE TIME:  2018/10/22
 * MODIFY TIME:
 * DES: https://leetcode-cn.com/problems/two-sum/description/
 \**********************************************************/
//

import Foundation
class TwoNumSum {
    //暴力法
    //遍历每个元素 x，并查找是否存在一个值与 target−x 相等的目标元素
    class func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for (i, value1) in nums.enumerated() {
            let j = i + 1;
            for value2 in nums[j..<nums.count] {
                if value2 == target - value1 {
                    return [i, j]
                }
            }
        }
        return []
    }
    
     class func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        for (index, value) in nums.enumerated() {
            var j = index + 1
            while j < nums.count {
                if nums[j] == target - value {
                    return [index, j]
                }
                j += 1
            }
        }
        return []
    }
    
    //两遍哈希表
    class func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for (index, value) in nums.enumerated() {
            map[value] = index
        }
        
        for (index, value) in nums.enumerated() {
            let diffValue = target - value;
            if (map.keys.contains(diffValue)) && (map[diffValue]  != index) {
                return [index, map[diffValue]!]
            }
        }
        return []
    }
    
    //一遍哈希表
    class func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for (index, value) in nums.enumerated() {
            let diffValue = target - value
            if map.keys.contains(diffValue) {
                return [map[diffValue]!, index]
            }
            
            map[value] = index
        }
        
        return []
    }
    
    class func twoSum4(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for index in 0..<nums.count {
            if let lastIndex = map[target-nums[index]] {
                return [lastIndex, index]
            }
            map[nums[index]] = index
        }
        return []
    }
    
    class func Mysort(_ nums: [Int]) -> [Int] {
        guard nums.count >= 1 else {
            return nums
        }
        var arr = nums
        
        for index in 1..<nums.count {
            let value = arr[index]
            var j = index - 1
            while j >= 0 {
                if  arr[j] > value {
                    arr[j+1] = arr[j]
                } else {
                    break
                }
                j -= 1
            }
            arr[j+1] = value
        }
        return arr
    }
}
