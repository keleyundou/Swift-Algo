//
//  BinaryTree.swift
//  Algo
//
//  Created by ColaBean on 2022/11/28.
//  Copyright © 2022 OrganizationX. All rights reserved.
//

import Foundation

class BinaryTree {
    class TreeNode {
        let val: Int
        var left: TreeNode?
        var right: TreeNode?
        
        init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
            self.val = val
            self.left = left
            self.right = right
        }
    }
    
    class Solution {
        // 层序遍历
        func levelTraverse(_ root: TreeNode?) {
            if root == nil { return }
            var queue = [TreeNode]()
            queue.append(root!)
            while !queue.isEmpty {
                let size = queue.count
                for _ in 0..<size {
                    let node = queue.first!
                    if node.left != nil {
                        queue.append(node.left!)
                    }
                    if node.right != nil {
                        queue.append(node.right!)
                    }

                }
            }
        }
        
        var res = [[Int]]()
        func levelTraverse2(_ root: TreeNode?) -> [[Int]] {
            if root == nil {
                return []
            }
            traverse(root, 0)
            return res
        }
        
        func traverse(_ root: TreeNode?, _ depth: Int) {
            if root == nil { return }
            if res.count <= depth {
                res.append([Int]())
            }
            res[depth].append(root!.val)
            traverse(root?.left, depth + 1)
            traverse(root?.right, depth + 1)
        }
        
        // 226. 翻转二叉树
        // @see https://leetcode.cn/problems/invert-binary-tree/
        func invertTree(_ root: TreeNode?) -> TreeNode? {
            if let root = root {
                let tmp = root.left
                root.left = root.right
                root.right = tmp
                let _ = invertTree(root.left)
                let _ =  invertTree(root.right)
            }
            return root
        }
        
    }
}
