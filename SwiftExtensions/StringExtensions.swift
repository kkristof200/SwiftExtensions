//
//  StringExtensions.swift
//
//  Created by Kristof Kovacs on 6/4/19.
//  Copyright © 2019 Kovács Kristóf. All rights reserved.
//

import Foundation

extension String {
    func contains(any: [String], caseInSensitive: Bool = false) -> Bool {
        for subStr in any {
            if caseInSensitive {
                if self.localizedCaseInsensitiveContains(subStr) {
                    return true
                }
            } else if self.contains(subStr) {
                return true
            }
        }
        
        return false
    }
    
    func substring(from: Int?, to: Int?) -> String {
        if let start = from {
            guard start < self.count else {
                return ""
            }
        }
        
        if let end = to {
            guard end >= 0 else {
                return ""
            }
        }
        
        if let start = from,
            let end = to {
            guard end - start >= 0 else {
                return ""
            }
        }
        
        let startIndex: String.Index
        
        if let start = from,
            start >= 0 {
            startIndex = self.index(self.startIndex,
                                    offsetBy: start)
        } else {
            startIndex = self.startIndex
        }
        
        let endIndex: String.Index
        
        if let end = to,
            end >= 0,
            end < self.count {
            endIndex = self.index(self.startIndex,
                                  offsetBy: end + 1)
        } else {
            endIndex = self.endIndex
        }
        
        return String(self[startIndex ..< endIndex])
    }
    
    func substring(from: Int) -> String {
        return self.substring(from: from,
                              to: nil)
    }
    
    func substring(to: Int) -> String {
        return self.substring(from: nil,
                              to: to)
    }
    
    func substring(from: Int?, length: Int) -> String {
        guard length > 0 else {
            return ""
        }
        
        let end: Int
        
        if let start = from, start > 0 {
            end = start + length - 1
        } else {
            end = length - 1
        }
        
        return self.substring(from: from,
                              to: end)
    }
    
    func substring(length: Int, to: Int?) -> String {
        guard let end = to, end > 0,
            length > 0 else {
            return ""
        }
        
        let start: Int
        
        if let end = to,
            end - length > 0 {
            start = end - length + 1
        } else {
            start = 0
        }
        
        return self.substring(from: start,
                              to: to)
    }
}
