//
//  UserDefaults+Extensions.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 11/8/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

public extension UserDefaults {
    
    static func save<Value: Encodable>(encodableValue value: Value,
                                       forKey key: String) throws {
        standard.set(try value.jsonEncoded(), forKey: key)
    }
    
    static func retrieveDecodableValue<Value: Decodable>(forKey key: String) -> Value? {
        guard let data = standard.object(forKey: key) as? Data else { return nil }
        return try? data.jsonDecoded()
    }
    
}
