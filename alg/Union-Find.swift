import Foundation
import XCTest

class UnionFind {
    var nodes: [Int]
    var size: [Int]
    
    init(count:Int) {
        self.nodes = Array(repeating: 0, count: count)
        for index in 0..<count {
            nodes[index] = index
        }
        self.size = Array(repeating: 1, count: count)
    }
    
    func connected(_ firstNode:Int, _ secondNode:Int) -> Bool {
        return root(node: firstNode) == root(node: secondNode)
    }
    
    func connect(_ firstNode:Int, _ secondNode:Int) {
        guard !connected(firstNode, secondNode) else { return }
        
        if size[firstNode] > size[secondNode] {
            nodes[secondNode] = firstNode
            size[firstNode] += size[secondNode]
            return
        }
        
        nodes[firstNode] = secondNode
        size[secondNode] += size[firstNode]
    }
    
    private func root(node:Int) -> Int {
        var current = node
        while nodes[current] != current {
            current = nodes[current]
            nodes[node] = current
        }
        return current
    }
}

class UnionFindTest: XCTestCase {
    func testConnections() {
        let uf = UnionFind(count: 11)
        uf.connect(3, 4)
        uf.connect(4, 8)
        XCTAssertTrue(uf.connected(3, 8))
    }
    
    func testMoreConnections() {
        let uf = UnionFind(count: 11)
        uf.connect(0, 10)
        uf.connect(1, 10)
        XCTAssertTrue(uf.connected(1, 0))
    }
}
