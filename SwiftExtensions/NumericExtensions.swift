//
//  NumericExtensions.swift
//
//  Created by Kristof Kovacs on 6/7/19.
//  Copyright © 2019 Kovács Kristóf. All rights reserved.
//

import Foundation

extension Numeric where Self: Comparable {
    //  inclusive - if true c.isBetWeen(a, b) -> returns true if c == a || c == b
    func isBetween(_ num1: Self, _ num2: Self, inclusive: Bool = true) -> Bool {
        let min = num1 < num2 ? num1 : num2
        let max = num1 > num2 ? num1 : num2
        
        if inclusive {
            return self >= min && self <= max
        }
        
        return self > min && self < max
    }
    
    var absoluteValue: Self {
        if self < 0 {
            return self * -1
        }
        
        return self
    }
}
