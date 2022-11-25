//
//  AlgoTests.swift
//  AlgoTests
//
//  Created by ColaBean on 2022/11/23.
//  Copyright © 2022 OrganizationX. All rights reserved.
//

import XCTest

final class AlgoTests: XCTestCase {

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
        let s = "This."
        var offsetIndex = s.index(s.startIndex, offsetBy: 0)
        var c = s[offsetIndex]
        XCTAssertEqual(c, "T")
        
        offsetIndex = s.index(s.startIndex, offsetBy: 1)
        c = s[offsetIndex]
        XCTAssertEqual(c, "h")
        
        offsetIndex = s.index(s.startIndex, offsetBy: 2)
        c = s[offsetIndex]
        XCTAssertEqual(c, "i")
        
        offsetIndex = s.index(s.startIndex, offsetBy: 3)
        c = s[offsetIndex]
        XCTAssertEqual(c, "s")
        
        offsetIndex = s.index(s.startIndex, offsetBy: 4)
        c = s[offsetIndex]
        XCTAssertEqual(c, ".")
        
    }
    
    func testCharacterCount() {
        let s = "abc"
        let charNums = s.reduce(into: [Character:Int]()) { partialResult, c in
//            if let val = partialResult[c] {
//                partialResult[c] = val + 1
//            } else {
//                partialResult[c] = 1
//            }
            partialResult[c, default: 0] += 1
        }
        XCTAssertEqual(charNums["a"], 1)
        XCTAssertEqual(charNums["b"], 1)
        XCTAssertEqual(charNums["c"], 1)
        
        let charNums2 = s.reduce(into: [Character:Int]()) {$0[$1, default: 0] += 1 }
        XCTAssertEqual(charNums2["a"], 1)
        XCTAssertEqual(charNums2["b"], 1)
        XCTAssertEqual(charNums2["c"], 1)
    }
    
    func testPow() {
        let r = pow(Decimal(2), 3)
        print(r)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
