//
//  Data+Extensions.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 12/29/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

public extension Data {
    
    func jsonDecoded<T: Decodable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }
    
}
