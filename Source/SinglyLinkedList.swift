//
//  SinglyLinkedList.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 7/31/19.
//  Copyright © 2019 Gonzalo Reyes Huertas. All rights reserved.
//

extension SinglyLinkedList {
    
    class Node {
        
        let value: Element
        var next: Node?
        
        init(_ value: Element, next: Node? = nil) {
            self.value = value
            self.next = next
        }
        
    }
    
}

struct SinglyLinkedList<Element> {
    
    // MARK: - Properties
    
    var head: Node?
    var tail: Node?
    
    var isEmpty: Bool { return head == nil }
    
    // MARK: - Lifecycle
    
    init() { }
    
    // MARK: - Methods
    
    func peek() -> Element? {
        return head?.value
    }
    
    mutating func push(_ element: Element) {
        head = Node(element, next: head)
        if tail == nil { tail = head }
    }
    
    mutating func append(_ element: Element) {
        if isEmpty { return push(element) }
        tail?.next = Node(element)
        tail = tail?.next
    }
    
    mutating func pop() -> Element? {
        defer {
            head = head?.next
            tail = (head == nil) ? nil : tail
        }
        return head?.value
    }
    
}
