// Copyright © 2019 OrganizationX.
// All rights reserved.
/**********************************************************\
 * PROJECTNAME:  Algo
 * FILENAME:     ValidParentheses.swift
 * AUTHER:       ColaBean
 * CREATE TIME:  2019/1/22
 * MODIFY TIME:
 * DES:
 \**********************************************************/
//

import Foundation

class ValidParentheses {
    class func isValid(_ s: String) -> Bool {
//        return method1(s: s)
        return method2(s: s)
    }
    
    class func method1(s: String) -> Bool {
        var stack: [Character] = []
        for item in s {
            if item == "(" || item == "[" || item == "{" {
                stack.append(item)
            } else {
                guard !stack.isEmpty else {
                    return false
                }
                
                if (item == "}" || item == "]" || item == ")") && match(l: stack.last!, r: item) {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        
        guard stack.isEmpty else {
            return false
        }
        return true
    }
    
    class func match(l: Character, r: Character) -> Bool {
        if l == "(" && r == ")" {
            return true
        }
        
        if l == "[" && r == "]" {
            return true
        }
        
        if l == "{" && r == "}" {
            return true
        }
        
        return false
    }
    
    //MARK:
    class func method2(s: String) -> Bool {
        let map = ["}":"{", "]":"[", ")":"("]
        var stack: [Character] = []
        
        for c in s {
            let key = String(c)
            if map.keys.contains(key) {
                let topElement = stack.isEmpty ? "#" : String(stack.popLast()!)
                
                if topElement != map[key] {
                    return false
                }
            } else {
                stack.append(c)
            }
        }
        return stack.isEmpty
    }
    
}
