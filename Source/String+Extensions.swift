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
        let newStr = trimmingCharacters(in: .whitespaces)
        return newStr.count == 0 ? nil : newStr
    }
    
    func removingOccurrences<S: StringProtocol>(of string: S) -> String {
        return replacingOccurrences(of: string, with: String.empty)
    }
    
    func removingWhiteSpaces() -> String {
        return replacingOccurrences(of: String.whiteSpace, with: String.empty)
    }
    
}

public extension String {
    
    subscript (offset: Int) -> Character {
        return self[index(startIndex, offsetBy: offset)]
    }
    
    subscript (range: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[start..<end])
    }
    
    subscript (range: ClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[start...end])
    }
    
    subscript (range: PartialRangeUpTo<Int>) -> String {
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[..<end])
    }
    
    subscript (range: PartialRangeThrough<Int>) -> String {
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[...end])
    }
    
    subscript (range: PartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        return String(self[start...])
    }
    
}
