//
//  UserDefaults+Extensions.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 11/8/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

public extension UserDefaults {
    
    static func fetch<Value>(
        _ key: String
    ) -> Value? {
        return standard.object(forKey: key) as? Value
    }
    
    @discardableResult
    static func save<Value>(
        _ value: Value,
        forKey key: String
    ) -> Value {
        standard.set(value, forKey: key)
        return value
    }
    
    static func update<Value>(
        _ key: String,
        update: (Value) -> Value
    ) {
        guard let value: Value = fetch(key) else { return }
        save(update(value), forKey: key)
    }
    
    static func fetchOrCreate<Value>(
        _ key: String,
        create: @autoclosure () -> Value
    ) -> Value {
        return fetch(key) ?? save(create(), forKey: key)
    }
    
    static func updateOrCreate<Value>(
        _ key: String,
        update: (Value) -> Value,
        create: @autoclosure () -> Value
    ) {
        if let value: Value = fetch(key) {
            save(update(value), forKey: key)
        } else {
            save(create(), forKey: key)
        }
    }
    
}
