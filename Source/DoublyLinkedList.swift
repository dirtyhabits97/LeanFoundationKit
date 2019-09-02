//
//  DoublyLinkedList.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 9/1/19.
//  Copyright © 2019 Gonzalo Reyes Huertas. All rights reserved.
//

extension DoublyLinkedList {
    
    class Node {
        
        var value: Element
        var next: Node?
        weak var prev: Node?
        
        init(_ value: Element) {
            self.value = value
            self.next = nil
            self.prev = nil
        }
        
        func removeBindings() {
            next?.prev = prev
            prev?.next = next
            prev = nil
            next = nil
        }
        
    }
    
}

struct DoublyLinkedList<Element> {
    
    var head: Node?
    var tail: Node?
    
    var isEmpty: Bool { return tail == nil }
    
    mutating func push(_ node: Node) {
        node.removeBindings()
        node.next = head
        head?.prev = node
        head = node
        if tail == nil { tail = head }
    }
    
    @discardableResult
    mutating func pop() -> Node? {
        defer {
            if tail === head {
                tail = nil
                head = nil
            } else {
                tail = tail?.prev
                tail?.next = nil
            }
        }
        return tail
    }
    
    mutating func remove(_ node: Node) {
        if node === head && node === tail {
            head = nil
            tail = nil
        } else if node === head {
            head = head?.next
            node.next = nil
        } else if node === tail {
            tail = tail?.prev
            tail?.next = nil
        }
    }
    
}
