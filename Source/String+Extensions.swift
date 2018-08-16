//
//  String+Extensions.swift
//  LeanToolsKit
//
//  Created by Gonzalo Reyes Huertas on 8/16/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

extension String {
    
    public func cleanned() -> String? {
        let newStr = self.trimmingCharacters(in: .whitespaces)
        return newStr.count == 0 ? nil : newStr
    }
    
}
