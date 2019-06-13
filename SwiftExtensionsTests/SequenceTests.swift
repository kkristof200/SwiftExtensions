//
//  SequenceTests.swift
//  SwiftExtensionsTests
//
//  Created by Kristof Kovacs on 6/13/19.
//

import XCTest

class SequenceTests: XCTestCase {
    class C: Comparable {
        static func < (lhs: SequenceTests.C, rhs: SequenceTests.C) -> Bool { return lhs.v < rhs.v }
        static func == (lhs: SequenceTests.C, rhs: SequenceTests.C) -> Bool { return lhs.v == rhs.v }
        
        let v: Int
        
        init(_ v: Int) {
            self.v = v
        }
    }
    
    func testSorted() {
        XCTAssertTrue([C(1), C(0)].sorted(by: \.v, <) == [C(0), C(1)])
        XCTAssertTrue([C(0), C(1)].sorted(by: \.v, >) == [C(1), C(0)])
    }
}

typealias SequenceTestsComparable = SequenceTests
extension SequenceTestsComparable {
    func testContainswithOperation() {
        XCTAssertTrue([0, 1, 2, 2].contains(minimum: 2, >, 1))
        XCTAssertTrue([0, 1, 2, 2].contains(minimum: 3, >=, 1))
        XCTAssertFalse([0, 1, 2, 2].contains(minimum: 3, >, 1))
    }
    
    func testSortedAscending() {
        XCTAssertTrue([0, 1, 0].sortedAscending() == [0, 0, 1])
    }
    
    func testSortedDescending() {
        XCTAssertTrue([0, 1, 0].sortedDescending() == [1, 0, 0])
    }
}

typealias SequenceTestsEquatable = SequenceTests
extension SequenceTestsEquatable {
    func testContainsAny() {
        XCTAssertTrue([1, 2].contains(any: [2, 3]))
    }
    
    func testContains() {
        XCTAssertTrue([1, 2].contains(2))
    }
}

typealias SequenceTestsNumeric = SequenceTests
extension SequenceTestsNumeric {
    func testSum() {
        XCTAssertTrue([1, 2].sum() == 3)
    }
}
