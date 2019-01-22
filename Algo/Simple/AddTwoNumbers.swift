// Copyright © 2018年 OrganizationX.
// All rights reserved.
/**********************************************************\
 * PROJECTNAME:  Algo
 * FILENAME:     AddTwoNumbers.swift
 * AUTHER:       ColaBean
 * CREATE TIME:  2018/10/23
 * MODIFY TIME:
 * DES:
 \**********************************************************/
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class AddTwoNumbers {
    class func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        var p = l1, q = l2, curr = dummyHead
        var carry: Int = 0
        
        while p != nil || q != nil {
            let x = (p != nil) ? p?.val : 0
            let y = (q != nil) ? q?.val : 0
            let sum = x! + y! + carry
            
            carry = sum / 10
            
            let newNode = ListNode(sum % 10)
            curr.next = newNode
            curr = curr.next!
            
            if p != nil {
                p = p?.next
            }
            
            if q != nil {
                q = q?.next
            }
            
        }
        
        if carry != 0 {
            curr.next = ListNode(carry)
        }
        
        return dummyHead.next
    }
}
