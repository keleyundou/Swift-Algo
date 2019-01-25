// Copyright © 2018年 OrganizationX.
// All rights reserved.
/**********************************************************\
 * PROJECTNAME:  Algo
 * FILENAME:     main.swift
 * AUTHER:       ColaBean
 * CREATE TIME:  2018/10/22
 * MODIFY TIME:
 * DES: 
 \**********************************************************/
//

import Foundation

let greeting = "Hello, World!"

print(greeting)

print(TwoNumSum.Mysort([4, 3, 2, 0, 1]))

//MARK: 两数之和
print("TwoNumSum.twoSum1([2, 7, 11, 15], 9)=>\(TwoNumSum.twoSum1([2, 7, 11, 15], 9))")

print("TwoNumSum.twoSum2([2, 7, 11, 15], 9)=>\(TwoNumSum.twoSum2([2, 7, 11, 15], 9))")

print("TwoNumSum.twoSum3([2, 7, 11, 15], 9)=>\(TwoNumSum.twoSum3([2, 7, 11, 15], 9))")

//MARK: 两数相加
//243 564 708

let l1_array = [2, 4, 3], l2_array = [5, 6, 4]

//var l1: ListNode?, l2: ListNode?
var l1 = ListNode(2), l2 = ListNode(5)
l1.next = ListNode(4)
l1.next?.next = ListNode(3)

l2.next = ListNode(6)
l2.next?.next = ListNode(4)

let ret = AddTwoNumbers.addTwoNumbers(l1, l2)

print(ret?.val as Any)

//MARK: 整数反转
print("ReverseInteger.reverse(1534236469)=>\(ReverseInteger.reverse(1534236469))")

//MARK: 回文数
print("PalindromicNumber.isPalindrome(121)=>\(PalindromicNumber.isPalindrome(121))")


//MARK: 最长公共前缀
let commonPrefixArray: [String] = ["flower","flow","flight"]

print("Longest Common Prefix: \(LongestCommonPrefix.longestCommonPrefix(commonPrefixArray))")

//for (i, c) in greeting.enumerated() {
//    print("Char:\(c) index:\(i)")
//}
//
//let aString: NSString = "hpj"
//print(aString.character(at: 0))

//MARK: 有效的括号
let parentheses = "({})[]"
print("The Valid Parentheses: \(ValidParentheses.isValid(parentheses))")

//MARK: 从排序数组中删除重复项

var nums = [1,1,2]
let numsCount = RemoveDuplicates.remove(&nums)
print("removed duplicates from sorted array: \(nums) numsCount:\(numsCount)")

//MARK: 最大子序和

//4, -3, 5, -2, -1, 2, 6, -2
//[-2, -1]
//[1,-1,1]
print("[-2,1,-3,4,-1,2,1,-5,4] max subarray sum: \(MaxSubArray.maxSum([1,-1,1]))")

//MARK: 二叉树的最大深度
//给定二叉树 [3,9,20,null,null,15,7]
let root: TreeNode = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)
print("Maximum Depth Of Binary Tree: \(MaximumDepthOfBinaryTree.maxDepth(root))")

//MARK: 买卖股票最大利润
print("Max Profit: \(maxProfit2([7, 1, 5, 3, 6, 4]))")
print("Max Profit: \(maxProfit3([1, 7, 2, 3, 6, 7, 6, 7]))")
print("Max Profit: \(maxProfit4([1, 7, 2, 3, 6, 7, 6, 7]))")
print("Max Profit: \(maxProfit5([1, 7, 2, 3, 6, 7, 6, 7]))")
