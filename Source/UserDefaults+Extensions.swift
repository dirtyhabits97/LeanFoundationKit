//
//  UserDefaults+Extensions.swift
//  LeanToolsKit
//
//  Created by Gonzalo Reyes Huertas on 11/8/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    public class func save<V>(value: V, forKey key: String) {
        standard.set(value, forKey: key)
    }
    
    public class func retrieveValue<V>(forKey key: String) -> V? {
        return standard.object(forKey: key) as? V
    }
    
    public class func removeValue(forKey key: String) {
        standard.removeObject(forKey: key)
    }
    
    public class func removeValue<Keys: Sequence>(forKeys keys: Keys) where Keys.Element == String {
        keys.forEach(standard.removeObject)
    }
    
}
