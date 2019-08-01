//
//  Queue.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 7/31/19.
//  Copyright © 2019 Gonzalo Reyes Huertas. All rights reserved.
//

public struct Queue<Element> {
    
    // MARK: - Properties
    
    private var storage = SinglyLinkedList<Element>()

    public var isEmpty: Bool { return storage.isEmpty }
    
    // MARK: - Lifecycle
    
    public init() { }
    
    // MARK: - Methods
    
    public func peek() -> Element? {
        return storage.peek()
    }
    
    public mutating func enqueue(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func dequeue() -> Element? {
        return storage.pop()
    }
    
}
