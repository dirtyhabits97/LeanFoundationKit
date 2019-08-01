//
//  Stack.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 7/31/19.
//  Copyright © 2019 Gonzalo Reyes Huertas. All rights reserved.
//

public struct Stack<Element> {
    
    // MARK: - Properties
    
    private var storage: [Element] = []
    
    public var isEmpty: Bool { return storage.isEmpty }
    
    // MARK: - Lifecycle
    
    public init() { }
    
    // MARK: - Methods
    
    public func peek() -> Element? {
        return storage.last
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
}
