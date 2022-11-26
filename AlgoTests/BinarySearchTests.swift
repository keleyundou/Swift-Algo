//
//  BinarySearchTests.swift
//  AlgoTests
//
//  Created by ColaBean on 2022/11/26.
//  Copyright © 2022 OrganizationX. All rights reserved.
//

import XCTest

final class BinarySearchTests: XCTestCase {
    typealias Solution = BinarySearch.Solution
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
        let r1 = solution.binarySearch([-1,0,3,5,9,12], 9)
        let r2 = solution.binarySearch([-1,0,3,5,9,12], 2)
        
        XCTAssertEqual(r1, 4)
        XCTAssertEqual(r2, -1)
        
    }
    
    func testLeftBound() {
        let r1 = solution.leftBound([5,7,7,8,8,10], 8)
        let r2 = solution.leftBound([5,7,7,8,8,10], 6)
        let r3 = solution.leftBound([1], 1)
        XCTAssertEqual(r1, 3)
        XCTAssertEqual(r2, -1)
        XCTAssertEqual(r3, 0)
    }
    
    func testRightBound() {
        let r1 = solution.rightBound([5,7,7,8,8,10], 8)
        let r2 = solution.rightBound([5,7,7,8,8,10], 6)
        let r3 = solution.rightBound([1], 1)
        XCTAssertEqual(r1, 4)
        XCTAssertEqual(r2, -1)
        XCTAssertEqual(r3, 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
