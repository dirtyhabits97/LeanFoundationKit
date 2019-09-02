//
//  LFUCache.swift
//  LeanFoundationKit
//
//  Created by Gonzalo Reyes Huertas on 9/1/19.
//  Copyright © 2019 Gonzalo Reyes Huertas. All rights reserved.
//

public struct LFUCache<Key: Hashable, Element> {
    
    private typealias LinkedList = DoublyLinkedList<_Data>
    private typealias Node = DoublyLinkedList<_Data>.Node
    
    // MARK: - Properties
    
    public let capacity: Int
    public var minFrequency: Int
    
    private var nodes: [Key: Node]
    private var lists: [Int: LinkedList]
    
    // MARK: - Lifecycle
    
    public init(capacity: Int) {
        self.capacity = max(capacity, 1)
        self.minFrequency = 0
        self.nodes = [:]
        self.lists = [:]
    }
    
    // MARK: - Cache methods
    
    public mutating func get(_ key: Key) -> Element? {
        guard let node = nodes[key] else { return nil }
        updateFrequency(for: node)
        return node.value.val
    }
    
    public mutating func set(_ key: Key, value: Element) {
        // update key if it exists in cache
        if let node = nodes[key] {
            node.value.val = value
            updateFrequency(for: node)
            return
        }
        // check if already at max capacity
        if nodes.count == capacity {
            removeLeastFrequent()
        }
        // create new node
        let node = Node(_Data(key: key, val: value, count: 1))
        // add to nodes cache
        nodes[key] = node
        // add to list cache
        var list = lists[node.value.count, default: LinkedList()]
        list.push(node)
        lists[node.value.count] = list
        // update min frequency
        minFrequency = 1
    }
    
    // MARK: - Helper methods
    
    private mutating func updateFrequency(for node: Node) {
        guard var list = lists[node.value.count] else { return }
        // remove the node from the its current count-list
        list.remove(node)
        lists[node.value.count] = list.isEmpty ? nil : list
        // check if the min should be updated
        if minFrequency == node.value.count && list.isEmpty {
            minFrequency += 1
        }
        // add the node to the next count-list
        node.value.count += 1
        var newList = lists[node.value.count, default: LinkedList()]
        newList.push(node)
        lists[node.value.count] = newList
    }
    
    private mutating func removeLeastFrequent() {
        guard var list = lists[minFrequency], let leastFrequent = list.pop() else { return }
        // remove from nodes cache
        nodes[leastFrequent.value.key] = nil
        // update list
        lists[minFrequency] = list.isEmpty ? nil : list
    }
    
}

private extension LFUCache {
    
    struct _Data {
        
        let key: Key
        var val: Element
        var count: Int
        
    }
    
}
