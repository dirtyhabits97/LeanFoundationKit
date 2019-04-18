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
    
    @discardableResult
    static func save<Value>(_ value: Value,
                            forKey key: String) -> Value {
        standard.set(value, forKey: key)
        return value
    }
    
    @discardableResult
    static func update<Value>(_ key: String,
                              update: (Value) -> Value) -> Value? {
        guard let value: Value = fetch(key) else { return nil }
        return save(update(value), forKey: key)
    }
    
    static func fetchOrCreate<Value>(_ key: String,
                                     create: @autoclosure () -> Value) -> Value {
        return fetch(key) ?? save(create(), forKey: key)
    }
    
    @discardableResult
    static func updateOrCreate<Value>(_ key: String,
                                      updateOrCreate: (Value?) -> Value) -> Value {
        return save(updateOrCreate(fetch(key)), forKey: key)
    }
    
}

public extension UserDefaults {
    
    static func save<Value: Encodable>(encodable value: Value,
                                       forKey key: String) throws {
        standard.set(try value.jsonEncoded(), forKey: key)
    }
    
    static func fetchDecodable<Value: Decodable>(_ key: String) -> Value? {
        guard let data = standard.object(forKey: key) as? Data else { return nil }
        return try? data.jsonDecoded()
    }
    
}
