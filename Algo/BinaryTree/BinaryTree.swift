//
//  BinaryTree.swift
//  Algo
//
//  Created by ColaBean on 2022/11/28.
//  Copyright © 2022 OrganizationX. All rights reserved.
//

import Foundation

class BinaryTree {
    class TreeNode: NSObject, NSCopying {
        let val: Int
        var left: TreeNode?
        var right: TreeNode?
        
        init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
            self.val = val
            self.left = left
            self.right = right
        }
        
        func copy(with zone: NSZone? = nil) -> Any {
            let copyObj = TreeNode(val)
            copyObj.left = left?.copy() as? TreeNode
            copyObj.right = right?.copy() as? TreeNode
            return copyObj
        }
    }
    
    class Node {
        var val: Int
        var left: Node?
        var right: Node?
        var next: Node?
        init(_ val: Int, _ left: Node? = nil, _ right: Node? = nil, _ next: Node? = nil) {
            self.val = val
            self.left = left
            self.right = right
            self.next = next
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
        // 遍历模式
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
        
        // 分解问题模式
        func invertTree2(_ root: TreeNode?) -> TreeNode? {
            guard let root = root else { return nil }
            let leftNode = invertTree2(root.left)
            let rightNode = invertTree2(root.right)
            root.left = rightNode
            root.right = leftNode
            return root
        }
        
        // 116. 填充每个节点的下一个右侧节点指针
        // @see https://leetcode.cn/problems/populating-next-right-pointers-in-each-node/
        func connect(_ root: Node?) -> Node? {
            guard let root = root else { return nil }
            traverse(root.left, root.right)
            return root
        }
        
        func traverse(_ left: Node?, _ right: Node?) {
            if left == nil || right == nil {
                return
            }
            left?.next = right
            traverse(left?.left, left?.right)
            traverse(right?.left, right?.right)
            traverse(left?.right, right?.left)
        }
    }
}
