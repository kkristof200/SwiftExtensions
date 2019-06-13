//
//  ArrayExtensions.swift
//
//  Created by Kristof Kovacs on 5/31/19.
//  Copyright © 2019 Kovács Kristóf. All rights reserved.
//

import Foundation

extension Array {
    func merged<T>() -> Array<T>  where Element == Array<T> {
        var arr: [T] = []
        
        for arrElement in self {
            arr.append(contentsOf: arrElement)
        }
        
        return arr
    }
    
    mutating func append(_ newElement: Element, max: Int) {
        self.append(newElement)
        self = subArray(last: max)
    }
    
    mutating func trim(_ startIndex: Int, _ endIndex: Int) {
        self = subArray(startIndex, endIndex)
    }
    
    func first(_ i: Int) -> [Element] { return self.subArray(first: i) }
    func subArray(first: Int) -> [Element] {
        guard count > first else {
            return self
        }
        
        return subArray(0, first - 1)
    }
    
    func last(_ i: Int) -> [Element] { return self.subArray(last: i) }
    func subArray(last: Int) -> [Element] {
        guard count > last else {
            return self
        }
        
        return subArray(count - last, count-1)
    }
    
    func subArray(to index: Int) -> [Element] {
        guard count > index else {
            return self
        }
        
        return subArray(0, index)
    }
    
    func subArray(from index: Int) -> [Element] {
        guard count > index else {
            return self
        }
        
        return subArray(index, count-1)
    }
    
    func subArray(_ startIndex: Int, _ endIndex: Int) -> [Element] {
        guard count > startIndex && count > endIndex else {
            return self
        }
        
        return Array(self[startIndex...endIndex])
    }
}

extension Array where Element: Equatable {
    mutating func remove(element: Element, all: Bool = false) {
        if let index = firstIndex(of: element) {
            remove(at: index)
        } else {
            return
        }
        
        return remove(element: element, all: all)
    }
    
    func count(of object: Element) -> Int {
        var count = 0
        
        for element in self {
            count = element == object ? count + 1 : count
        }
        
        return count
    }
}

extension Array where Element: Comparable {
    func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count && self.sorted() == other.sorted()
    }
}
