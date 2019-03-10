//
//  String+Extensions.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 8/16/18.
//  Copyright © 2018 Gonzalo Reyes Huertas. All rights reserved.
//

import Foundation

private extension String {
    
    static let whiteSpace = " "
    static let empty = ""
    
}

public extension String {
    
    func cleanned() -> String? {
        let newStr = self.trimmingCharacters(in: .whitespaces)
        return newStr.count == 0 ? nil : newStr
    }
    
    func removingOccurrences(of string: String) -> String {
        return self.replacingOccurrences(of: string, with: String.empty)
    }
    
    func removingWhiteSpaces() -> String {
        return self.replacingOccurrences(of: String.whiteSpace, with: String.empty)
    }
    
}
