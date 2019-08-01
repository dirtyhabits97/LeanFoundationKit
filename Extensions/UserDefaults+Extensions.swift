//
//  UserDefaults+Extensions.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 11/8/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

public extension UserDefaults {
    
    static func fetch<Value>(_ key: String) -> Value? {
        return standard.object(forKey: key) as? Value
    }
    
    static func save<Value>(_ value: Value, forKey key: String) {
        standard.set(value, forKey: key)
    }
    
    static func update<Value>(_ key: String, _ update: (Value) -> Value) {
        guard let value: Value = fetch(key) else { return }
        save(update(value), forKey: key)
    }
    
    static func fetch<Value>(_ key: String, orCreate value: Value) -> Value {
        if fetch(key) == nil {
            save(value, forKey: key)
        }
        return fetch(key)!
    }
    
    static func update<Value>(
        _ key: String,
        _ update: (Value) -> Value,
        orCreate value: Value
    ) {
        if let value: Value = fetch(key) {
            save(value, forKey: key)
        } else{
            save(value, forKey: key)
        }
    }
    
}
