//
//  SequenceExtensions.swift
//
//  Created by Kristof Kovacs on 6/12/19.
//  Copyright © 2019 Kovács Kristóf. All rights reserved.
//

import Foundation

extension Sequence {
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>, _ operation: (T, T) -> Bool) -> [Element] {
        return sorted { operation($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
}

extension Sequence where Element: Comparable {
    func contains(minimum: Int = 1, _ operation: (Element, Element) -> Bool, _ element: Element) -> Bool {
        var containCount = 0
        
        for existingElement in self {
            if operation(existingElement, element) {
                containCount += 1
                
                if containCount >= minimum {
                    return true
                }
            }
        }
        
        return false
    }
    
    func sortedAscending() -> [Element] {
        return self.sorted(by: <)
    }
    
    func sortedDescending() -> [Element] {
        return self.sorted(by: >)
    }
}

extension Sequence where Element: Equatable {
    func contains(any: [Element]) -> Bool {
        for element in any {
            if self.contains(element) {
                return true
            }
        }
        
        return false
    }
    
    func contains(_ element: Element) -> Bool {
        return self.first(where: {$0 == element}) != nil
    }
}

extension Sequence where Element: Numeric {
    func sum() -> Element {
        return self.reduce(0, +)
    }
}
