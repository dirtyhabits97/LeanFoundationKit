//
//  String+Extensions.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 8/16/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

extension String {
    
    private static let whiteSpace = " "
    private static let empty = ""
    
    public func cleanned() -> String? {
        let newStr = self.trimmingCharacters(in: .whitespaces)
        return newStr.count == 0 ? nil : newStr
    }
    
    public func removingWhiteSpaces() -> String {
        return self.replacingOccurrences(of: String.whiteSpace, with: String.empty)
    }
    
}
