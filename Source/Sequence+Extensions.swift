//
//  Sequence+Extensions.swift
//  LeanToolsKit
//
//  Created by Gonzalo Reyes Huertas on 10/27/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

extension Sequence {
    
    public func group<Key>(by key: (Element) -> Key) -> [Key: [Element]] {
        return reduce(into: [Key: [Element]](), { (result, element) in
            result[key(element), default: []] += [element]
        })
    }
    
    public func unique<Key: Equatable>(by key: (Element) -> Key, filtering filteredKeys: [Key] = []) -> [Element] {
        var uniqueKeys: [Key] = []
        var uniqueElements: [Element] = []
        for element in self {
            let key = key(element)
            if !uniqueKeys.contains(key) && !filteredKeys.contains(key){
                uniqueKeys.append(key)
                uniqueElements.append(element)
            }
        }
        return uniqueElements
    }
    
    // source: https://www.youtube.com/watch?v=CTZOjl6_NuY
    public func pair() -> AnySequence<(Element, Element)> {
        return AnySequence(zip(self, self.dropFirst()))
    }
    
    public func all(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if !predicate(element) {
                return false
            }
        }
        return true
    }
    
    public func none(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if predicate(element) {
                return false
            }
        }
        return true
    }
    
    public func any(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if predicate(element) {
                return true
            }
        }
        return false
    }
    
    public func count(where predicate: (Element) -> Bool) -> Int {
        var count = 0
        for element in self {
            if predicate(element) {
                count += 1
            }
        }
        return count
    }
    
}

extension Sequence where Element: Numeric {
    
    public func sum() -> Element {
        return reduce(0, +)
    }
    
}
