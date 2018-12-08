//
//  Collection+Extensions.swift
//  LeanToolsKit
//
//  Created by Gonzalo Reyes Huertas on 12/3/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

extension Collection where Index == Int, Element: BinaryInteger {
    
    public func maxAndMin() -> (min: Element, max: Element)? {
        guard count > 0 else { return nil }
        var min = self[0]
        var max = self[0]
        for i in 0..<count {
            if self[i] < min {
                min = self[i]
            } else if self[i] > max {
                max = self[i]
            }
        }
        return (min, max)
    }
    
}

extension Collection where Index == Int, Element: FloatingPoint {
    
    public func maxAndMin() -> (min: Element, max: Element)? {
        guard count > 0 else { return nil }
        var min = self[0]
        var max = self[0]
        for i in 0..<count {
            if self[i] < min {
                min = self[i]
            } else if self[i] > max {
                max = self[i]
            }
        }
        return (min, max)
    }
    
}
