// Copyright © 2018年 OrganizationX.
// All rights reserved.
/**********************************************************\
 * PROJECTNAME:  Algo
 * FILENAME:     PalindromicNumber.swift
 * AUTHER:       ColaBean
 * CREATE TIME:  2018/10/26
 * MODIFY TIME:
 * DES:
 \**********************************************************/
//

import Foundation

class PalindromicNumber {
    
    class func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        
        var tmp = x
        
        var reverseNumber = 0
        
        while tmp > reverseNumber {
            reverseNumber = reverseNumber * 10 + tmp % 10
            tmp /= 10
        }
        return tmp == reverseNumber || tmp == reverseNumber / 10
    }
    
    //溢出问题
//    class func isPalindrome(_ x: Int) -> Bool {
//        guard x >= 0 else {
//            return false
//        }
//        var tmp = x
//        var ret = 0
//
//        while tmp != 0 {
//            let mod = tmp % 10
//            tmp /= 10
//            ret = ret * 10 + mod;
//        }
//
//        guard ret != x else {
//            return true
//        }
//        return false
//    }
}
