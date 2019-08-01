//
//  Encodable+Extensions.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 12/29/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

public extension Encodable {
    
    func jsonEncoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
}
