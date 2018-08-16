//
//  Result.swift
//  LeanToolsKit
//
//  Created by Gonzalo Reyes Huertas on 8/16/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failure(Error)
    
    var value: T? {
        switch self {
        case .success(let v): return v
        case .failure(_): return nil
        }
    }
}
