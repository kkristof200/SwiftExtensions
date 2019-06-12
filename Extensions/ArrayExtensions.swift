//
//  ArrayExtensions.swift
//
//  Created by Kristof Kovacs on 5/31/19.
//  Copyright © 2019 Kovács Kristóf. All rights reserved.
//

import Foundation

extension Array {
    mutating func append(_ newElement: Element, max: Int) {
        self.append(newElement)
        self = subArray(last: max)
    }
    
    mutating func trim(_ startIndex: Int, _ endIndex: Int) {
        self = subArray(startIndex, startIndex)
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
    mutating func remove(object: Element) -> Bool {
        if let index = firstIndex(of: object) {
            remove(at: index)
            
            return true
        }
        
        return false
    }
}

extension Array where Element: Comparable {
    func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count && self.sorted() == other.sorted()
    }
}

extension Array where Element: Numeric {
    func average() -> Decimal? {
        guard let decSum = Decimal(sum()) else {
            return nil
        }
        
        return decSum / Decimal(count)
    }
}
