//
//  LRUCache.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 9/1/19.
//  Copyright © 2019 Gonzalo Reyes Huertas. All rights reserved.
//

public struct LRUCache<Key: Hashable, Element> {
    
    private typealias LinkedList = DoublyLinkedList<_Data>
    private typealias Node = DoublyLinkedList<_Data>.Node
    
    // MARK: - Properties
    
    public let capacity: Int
    
    private var nodes: [Key: Node]
    private var list: LinkedList
    
    // MARK: - Lifecycle
    
    public init(capacity: Int) {
        self.capacity = max(capacity, 1)
        self.nodes = [:]
        self.list = LinkedList()
    }
    
    // MARK: - Cache methods
    
    public mutating func get(_ key: Key) -> Element? {
        guard let node = nodes[key] else { return nil }
        updateMostRecent(node)
        return node.value.val
    }
    
    public mutating func set(_ key: Key, value: Element) {
        // update key if it exists in cache
        if let node = nodes[key] {
            node.value.val = value
            updateMostRecent(node)
            return
        }
        // check if already at max capacity
        if nodes.count == capacity {
            removeLeastRecent()
        }
        // create new node
        let node = Node(_Data(key: key, val: value))
        // add to nodes cache
        nodes[key] = node
        updateMostRecent(node)
    }
    
    // MARK: - Helper methods
    
    private mutating func updateMostRecent(_ node: Node) {
        list.remove(node)
        list.push(node)
    }
    
    private mutating func removeLeastRecent() {
        guard let leastRecent = list.pop() else { return }
        nodes[leastRecent.value.key] = nil
    }
    
}

private extension LRUCache {
    
    struct _Data {
        
        let key: Key
        var val: Element
        
    }
    
}
