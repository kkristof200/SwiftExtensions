//
//  StringTests.swift
//  SwiftExtensionsTests
//
//  Created by Kristof Kovacs on 6/13/19.
//

import XCTest

class StringTests: XCTestCase {
    func testContains(any: [String], caseInSensitive: Bool = false) {
        XCTAssertTrue("0123".contains(any: ["3", "4"]))
        XCTAssertTrue("JJJ".contains(any: ["j", "a"], caseInSensitive: true))
        XCTAssertFalse("JJJ".contains(any: ["j", "a"]))
    }
    
    func testSubstring() {
        XCTAssertTrue("1234".substring(to: 2) == "123")
        XCTAssertTrue("1234".substring(from: 1) == "234")
        XCTAssertTrue("1234".substring(from: 1, to: 2) == "23")
        XCTAssertTrue("1234".substring(from: 1, length: 2) == "23")
    }
}
