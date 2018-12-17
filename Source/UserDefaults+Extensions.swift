//
//  UserDefaults+Extensions.swift
//  LeanToolsKit
//
//  Created by Gonzalo Reyes Huertas on 11/8/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    public class func save<V: Encodable>(encodableValue value: V, forKey key: String) {
        guard let data = try? JSONEncoder().encode(value) else { return }
        standard.set(data, forKey: key)
    }
    
    public class func retrieveDecodableValue<V: Decodable>(forKey key: String) -> V? {
        guard let data = standard.object(forKey: key) as? Data else { return nil }
        return try? JSONDecoder().decode(V.self, from: data)
    }
    
}
