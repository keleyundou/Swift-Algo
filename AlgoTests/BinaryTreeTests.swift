//
//  BinaryTreeTests.swift
//  AlgoTests
//
//  Created by ColaBean on 2022/11/30.
//  Copyright © 2022 OrganizationX. All rights reserved.
//

import XCTest

final class BinaryTreeTests: XCTestCase {
    
    typealias Solution = BinaryTree.Solution
    typealias TreeNode = BinaryTree.TreeNode
    typealias Node = BinaryTree.Node
    let solution = Solution()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
    }
    
    func testInvertTree() throws {
        /*
         输入：root = [4,2,7,1,3,6,9]
         输出：[4,7,2,9,6,3,1]
         */
        
        let root = TreeNode(4)
        root.left = TreeNode(2, TreeNode(1), TreeNode(3))
        root.right = TreeNode(7, TreeNode(6), TreeNode(9))
        
        let r = solution.invertTree(root.copy() as? TreeNode)
        let rr = printTreeNodeWithLevelTraverse(r)
        XCTAssertEqual(rr, [4,7,2,9,6,3,1])
        
        let r2 = solution.invertTree2(root.copy() as? TreeNode)
        let rr2 = printTreeNodeWithLevelTraverse(r2)
        XCTAssertEqual(rr2, [4,7,2,9,6,3,1])
        
    }
    
    private func printTreeNodeWithLevelTraverse(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var queue = [TreeNode]()
        queue.append(root)
        var res = [Int]()
        while !queue.isEmpty {
            let node = queue.removeFirst()
            res.append(node.val)
            
            if let leftNode = node.left {
                queue.append(leftNode)
            }
            
            if let rightNode = node.right {
                queue.append(rightNode)
            }
        }
        return res
    }
    
    func testConnect() {
        let root = Node(1)
        root.left = Node(2, Node(4), Node(5))
        root.right = Node(3, Node(6), Node(7))
        let r = solution.connect(root)
        
        let rr = printAll(r)
        print("[connect]: \(rr)")
        XCTAssertEqual(rr[0] as! Int, 1)
        XCTAssertEqual(rr[1] as! String, "#")
        XCTAssertEqual(rr[2] as! Int, 2)
        XCTAssertEqual(rr[3] as! Int, 3)
        XCTAssertEqual(rr[4] as! String, "#")
        XCTAssertEqual(rr[5] as! Int, 4)
        XCTAssertEqual(rr[6] as! Int, 5)
        XCTAssertEqual(rr[7] as! Int, 6)
        XCTAssertEqual(rr[8] as! Int, 7)
        XCTAssertEqual(rr[9] as! String, "#")
        
        
        func printAll(_ root: Node?) -> [Any] {
            guard let root = root else { return [] }
            var res = [Any]()
            var queue = [Node]()
            queue.append(root)
            while !queue.isEmpty {
                for _ in 0..<queue.count {
                    let node = queue.removeFirst()
                    res.append(node.val)
                    if node.next == nil {   
                        res.append("#")
                    }
                    
                    if let leftNode = node.left {
                        queue.append(leftNode)
                    }
                    if let rightNode = node.right {
                        queue.append(rightNode)
                    }
                }
            }
            return res
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
