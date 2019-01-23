// Copyright © 2019 OrganizationX.
// All rights reserved.
/**********************************************************\
 * PROJECTNAME:  Algo
 * FILENAME:     RemoveDuplicates.swift
 * AUTHER:       ColaBean
 * CREATE TIME:  2019/1/23
 * MODIFY TIME:
 * DES:
 \**********************************************************/
//

import Foundation

class RemoveDuplicates {
    class func remove(_ nums: inout [Int]) -> Int {
        var i = 0
        
        for j in 1..<nums.count {
            if nums[j] != nums[i] {
                i += 1
                nums[i] = nums[j]
            }
        }
        
        return i + 1
    }
}
