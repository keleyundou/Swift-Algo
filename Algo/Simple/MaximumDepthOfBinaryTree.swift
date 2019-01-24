// Copyright © 2019 OrganizationX.
// All rights reserved.
/**********************************************************\
 * PROJECTNAME:  Algo
 * FILENAME:     MaximumDepthOfBinaryTree.swift
 * AUTHER:       ColaBean
 * CREATE TIME:  2019/1/24
 * MODIFY TIME:
 * DES: https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
 \**********************************************************/
//

import Foundation

class TreeNode: Hashable {
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == rhs.right
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.val)
        hasher.combine(self.left)
        hasher.combine(self.right)
    }
    
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class MaximumDepthOfBinaryTree {
    class func maxDepth(_ root: TreeNode?) -> Int {
        return method1(root)
    }
    
    class func method1(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }

        let leftDepth = maxDepth(root?.left)
        let rightDepth = maxDepth(root?.right)
        return max(leftDepth, rightDepth) + 1
    }
    
    class func method2(_ root: TreeNode?) -> Int {
        var stack: Array<Dictionary<TreeNode, Int>> = Array()
        var rr = root
        if rr != nil {
            stack.append([rr!: 1])
        }
        
        var depth = 0
        while !stack.isEmpty {
            let current = stack.popLast()
            rr = current?.keys.first
            let current_depth = current?.values.first
            if rr != nil {
                depth = max(depth, current_depth!)
                if rr?.left != nil{
                    stack.append([(rr?.left)!: current_depth!+1])
                }
                
                if rr?.right != nil {
                    stack.append([(rr?.right)!: current_depth! + 1])
                }
            }
        }
        
        return depth
    }
}

