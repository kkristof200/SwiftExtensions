//
//  SwiftExtensionsTests.swift
//  SwiftExtensionsTests
//
//  Created by Kristof Kovacs on 6/13/19.
//

import XCTest

class ArrayTests: XCTestCase {
    func testMerged() {
        XCTAssertTrue([[1, 2], [3, 4]].merged() == [1, 2, 3, 4])
    }
    
    func testAppendMax() {
        var arr = [1, 2]
        arr.append(3, max: 2)
        
        XCTAssertTrue(arr == [2, 3])
    }
    
    func testTrim() {
        var arr = [1, 2, 3, 4]
        arr.trim(1, 2)
        
        XCTAssertTrue(arr == [2, 3])
    }
    
    func testFirst() {
        XCTAssertTrue([0, 1].first(1) == [0])
    }
    
    func testLast() {
        XCTAssertTrue([0, 1].last(1) == [1])
    }
}

typealias ArrayTestsEquatable = ArrayTests
extension ArrayTestsEquatable {
    func testRemove() {
        var arr = [1, 2, 2]
        
        arr.remove(element: 1)
        XCTAssertTrue(arr ==  [2, 2])
        
        arr.remove(element: 2, all: true)
        XCTAssertTrue(arr ==  [])
    }
    
    func testCount() {
        XCTAssertTrue([1, 2, 2].count(of: 2) == 2)
    }
}

typealias ArrayTestsComparable = ArrayTests
extension ArrayTestsComparable {
    func testsContainsSameElements() {
        XCTAssertTrue([0, 1, 2].containsSameElements(as: [2, 1, 0]))
    }
}
