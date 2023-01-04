//
//  MemoryStore.swift
//  youAndIConnection
//
//  Created by 염성필 on 2023/01/04.
//

import Foundation

class MemoryStore: ObservableObject {
    @Published var memoryList: [Memory] = []
    
//    init() {
//        memoryList = [
//            Memory(id: "123", description: "안녕하세요"),
//            Memory(id: "456", description: "안녕하세요2"),
//            Memory(id: "789", description: "안녕하세요3"),
//            Memory(id: "1011", description: "안녕하세요4"),
//            Memory(id: "1012", description: "안녕하세요5")
//        ]
//    }
    
    func addMemory(memory: Memory) {
        memoryList.append(memory)
    }
    
}

