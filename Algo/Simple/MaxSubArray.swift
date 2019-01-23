// Copyright © 2019 OrganizationX.
// All rights reserved.
/**********************************************************\
 * PROJECTNAME:  Algo
 * FILENAME:     MaxSubArray.swift
 * AUTHER:       ColaBean
 * CREATE TIME:  2019/1/23
 * MODIFY TIME:
 * DES: https://blog.csdn.net/abnerwang2014/article/details/36027747
 \**********************************************************/
//

import Foundation

class MaxSubArray {
    class func maxSum(_ nums: [Int]) -> Int {
        return method2(nums: nums)
    }
    
    class func method1(nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        
        var ret = nums.first!, sum = 0
        
        for item in nums {
            if sum > 0 {
                sum += item
            } else {
                sum = item
            }
            ret = max(ret, sum)
        }
        
        return ret
    }
    
    class func method2(nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        
        return maxSum(nums, l: 0, r: nums.count-1)
    }
    
    /*
     最大子序列和可能存在于三个位置中的某个位置
     1、左半部分的最大子序列和
     2、右半部分的最大子序列和
     3、横跨左半部分和有半部分的最大子序列和：包含左半部分的最右一个元素的最大子序列和与包含右半部分的第一个元素的最大子序列和的和
     4、比较1、2、3所得的最大值即为最大子序列和
     */
    class func maxSum(_ nums: [Int], l left: Int, r right: Int) -> Int {
        if left == right {
            return nums[left]
        }
        
        let mid = (left + right) / 2
        let leftSum = maxSum(nums, l: left, r: mid)
        let rightSum = maxSum(nums, l: mid+1, r: right)
        
        var leftMaxSum = nums[mid], ls = 0

        // 左序列包含最右一个元素的最大序列和
        for i in (left...mid).reversed() {
            ls += nums[i]
            if leftMaxSum < ls {
                leftMaxSum = ls
            }
        }
        
        var rightMaxSum = nums[mid+1], rs = 0

        // 右序列包含最左一个元素的最大序列和
        for i in mid + 1...right {
            rs += nums[i]
            if rightMaxSum < rs {
                rightMaxSum = rs
            }
        }
        
        return max3(arg1: leftSum, arg2: rightSum, arg3: leftMaxSum+rightMaxSum)
    }
    
    class func max3(arg1: Int, arg2: Int, arg3: Int) -> Int {
        return max(max(arg1, arg2), arg3)
    }
}
