//
//  RandomizedSetTests.swift
//  AlgoTests
//
//  Created by ColaBean on 2022/11/27.
//  Copyright © 2022 OrganizationX. All rights reserved.
//

import XCTest

final class RandomizedSetTests: XCTestCase {
    
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
        
        /**
         * Your RandomizedSet object will be instantiated and called as such:
         * let obj = RandomizedSet()
         * let ret_1: Bool = obj.insert(val)
         * let ret_2: Bool = obj.remove(val)
         * let ret_3: Int = obj.getRandom()
         */
        
        let obj = RandomizedSet()
        let r1 = obj.insert(1)
        let r2 = obj.remove(2)
        let r3 = obj.insert(2)
        let r4 = obj.getRandom()
        let r5 = obj.remove(1)
        let r6 = obj.insert(2)
        let r7 = obj.getRandom()
        
        XCTAssertTrue(r1)
        XCTAssertFalse(r2)
        XCTAssertTrue(r3)
        XCTAssertTrue(r4 == 1 || r4 == 2)
        XCTAssertTrue(r5)
        XCTAssertFalse(r6)
        XCTAssertEqual(r7, 2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
