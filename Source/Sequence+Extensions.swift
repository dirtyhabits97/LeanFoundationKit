//
//  Sequence+Extensions.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 10/27/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

public extension Sequence {
    
    func grouped<Key: Hashable>(by key: (Element) throws -> Key) rethrows -> [Key: [Element]] {
        var result: [Key: [Element]] = [:]
        for element in self {
            let key = try key(element)
            result[key, default: []] += [element]
        }
        return result
    }
    
    func uniqued<Key: Hashable>(by key: (Element) throws -> Key) rethrows -> [Element] {
        var uniqueKeys: Set<Key> = []
        var uniqueElements: [Element] = []
        for element in self {
            let key = try key(element)
            if !uniqueKeys.contains(key) {
                uniqueKeys.insert(key)
                uniqueElements.append(element)
            }
        }
        return uniqueElements
    }
    
    func count(where predicate: (Element) -> Bool) -> Int {
        var count = 0
        for element in self {
            if predicate(element) {
                count += 1
            }
        }
        return count
    }
    
}

public extension Sequence {
    
    func all(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if !predicate(element) {
                return false
            }
        }
        return true
    }
    
    func none(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if predicate(element) {
                return false
            }
        }
        return true
    }
    
    func any(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if predicate(element) {
                return true
            }
        }
        return false
    }
    
}

public extension Sequence where Element: Numeric {
    
    func sum() -> Element {
        return reduce(0, +)
    }
    
}
