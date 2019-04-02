//
//  Array+Extensions.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 3/24/19.
//  Copyright © 2019 Gonzalo Reyes Huertas. All rights reserved.
//

public extension Array {
    
    var powerSet: [[Element]] {
        guard count > 0 else { return [[]] }
        // tail contains the whole arr except the first element
        let tail = Array(self[1..<endIndex])
        // head constains only the first element
        let head = self[0]
        // compute the tail powerset
        let withoutHead = tail.powerSet
        // compute the head powerset
        let withHead = withoutHead.map { $0 + [head] }
        // return the tail powerset and top powerset
        return withHead + withoutHead
    }
    
}
