//
//  UserDefaults+Extensions.swift
//  LeanToolsKit
//
//  Created by Gonzalo Reyes Huertas on 11/8/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    public class func save<V: Encodable>(encodableValue value: V, forKey key: String) throws {
        standard.set(try value.jsonEncode(), forKey: key)
    }
    
    public class func retrieveDecodableValue<V: Decodable>(forKey key: String) -> V? {
        guard let data = standard.object(forKey: key) as? Data else { return nil }
        return try? data.jsonDecode()
    }
    
}
