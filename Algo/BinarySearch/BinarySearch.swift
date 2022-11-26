//
//  BinarySearch.swift
//  Algo
//
//  Created by ColaBean on 2022/11/26.
//  Copyright © 2022 OrganizationX. All rights reserved.
//

import Foundation

class BinarySearch {
    class Solution {
        // 704. 二分查找
        // @see https://leetcode.cn/problems/binary-search/
        func binarySearch(_ nums: [Int], _ target: Int) -> Int {
            var left = 0, right = nums.count - 1
            while left <= right {
                let mid = left + (right - left) / 2
                if nums[mid] == target {
                    return mid
                } else if nums[mid] < target {
                    left = mid + 1
                } else if nums[mid] > target {
                    right = mid - 1
                }
            }
            return -1
        }
        
        // 34. 在排序数组中查找元素的第一个和最后一个位置
        // @see https://leetcode.cn/problems/find-first-and-last-position-of-element-in-sorted-array/
        func leftBound(_ nums: [Int], _ target: Int) -> Int {
            var left = 0, right = nums.count - 1
            while left <= right {
                let mid = left + (right - left) / 2
                if nums[mid] < target {
                    left = mid + 1
                } else if nums[mid] > target {
                    right = mid - 1
                } else if nums[mid] == target {
                    right = mid - 1
                }
            }
            if left == nums.count { return -1 }
            return nums[left] == target ? left : -1
        }
        
        func rightBound(_ nums: [Int], _ target: Int) -> Int {
            var left = 0, right = nums.count - 1
            while left <= right {
                let mid = left + (right - left) / 2
                if nums[mid] < target {
                    left = mid + 1
                } else if nums[mid] > target {
                    right = mid - 1
                } else if nums[mid] == target {
                    left = mid + 1
                }
            }
            if left - 1 < 0 { return -1 }
            return nums[left-1] == target ? left-1 : -1
        }
    }
}
