//
//  Int+Extensions.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 3/10/19.
//  Copyright © 2019 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

public extension Int {
    
    var digitsCount: Int {
        var count = 0
        var number = self
        while number != 0 {
            number /= 10
            count += 1
        }
        return count
    }
    
    func digit(atPosition position: Int) -> Int? {
        guard position < digitsCount else { return nil }
        let divisor = pow(Double(10), Double(position + 1))
        return self % Int(divisor) / Int(divisor/10)
    }
    
}
