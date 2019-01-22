// Copyright © 2018年 OrganizationX.
// All rights reserved.
/**********************************************************\
 * PROJECTNAME:  Algo
 * FILENAME:     ReverseInteger.swift
 * AUTHER:       ColaBean
 * CREATE TIME:  2018/10/25
 * MODIFY TIME:
 * DES:
 \**********************************************************/
//

import Foundation

class ReverseInteger {
    class func reverse(_ x: Int) -> Int {
        var rev = 0
        var n = x
        let IntMax =  Int32.max
        let IntMin =  Int32.min
        
        while n != 0 {
            let mod = n % 10
            n  /= 10
            rev = rev*10+mod
        }
        if rev > IntMax || rev < IntMin { return 0 }
        return rev
    }
    //            if (rev > IntMax/10 || (rev == IntMax / 10 && mod > 1)) { return 0 }
    //            if (rev < IntMin/10 || (rev == IntMin / 10 && mod < -1))  { return 0 }

}
