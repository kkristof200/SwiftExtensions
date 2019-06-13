//
//  NumericExtensions.swift
//  SwiftExtensionsTests
//
//  Created by Kristof Kovacs on 6/13/19.
//

import XCTest

class NumericTests: XCTestCase {
    func testIsBetween() {
        XCTAssertTrue(1.isBetween(0, 2))
        XCTAssertTrue(1.isBetween(0, 1))
        XCTAssertTrue(1.isBetween(1, 2))
        XCTAssertTrue(1.isBetween(1, 1))
        XCTAssertFalse(1.isBetween(0, 1, inclusive: false))
        XCTAssertFalse(1.isBetween(1, 2, inclusive: false))
    }
    
    func testAbsoluteValue() {
        XCTAssertTrue(1.absoluteValue == 1)
        XCTAssertTrue((-1).absoluteValue == 1)
    }
}
