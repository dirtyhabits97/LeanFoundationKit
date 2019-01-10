//
//  UserDefaults+Extensions.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 11/8/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    public class func save<Value: Encodable>(encodableValue value: Value, forKey key: String) throws {
        standard.set(try value.jsonEncoded(), forKey: key)
    }
    
    public class func retrieveDecodableValue<Value: Decodable>(forKey key: String) -> Value? {
        guard let data = standard.object(forKey: key) as? Data else { return nil }
        return try? data.jsonDecoded()
    }
    
}
