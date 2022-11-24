//
//  SlidingWindowTests.swift
//  AlgoTests
//
//  Created by ColaBean on 2022/11/23.
//  Copyright © 2022 OrganizationX. All rights reserved.
//

import XCTest

final class SlidingWindowTests: XCTestCase {
    
    typealias Solution = SlidingWindow.Solution
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
        let s1 = "EBBANCF"
        let t1 = "ABC"
        let r1 = solution.minWindow(s1, t1)
        
        let s2 = "ADOBECODEBANC"
        let t2 = "ABC"
        let r2 = solution.minWindow(s2, t2)
        
        XCTAssertEqual(r1, "BANC")
        XCTAssertEqual(r2, "BANC")
    }
    
    func testV2() {
        let s1 = "EBBANCF"
        let t1 = "ABC"
        let r1 = solution.minWindowV2(s1, t1)
        
        let s2 = "ADOBECODEBANC"
        let t2 = "ABC"
        let r2 = solution.minWindowV2(s2, t2)
        
        XCTAssertEqual(r1, "BANC")
        XCTAssertEqual(r2, "BANC")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
