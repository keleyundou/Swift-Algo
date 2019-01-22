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
