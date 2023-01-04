//
//  MemoryStore.swift
//  youAndIConnection
//
//  Created by 염성필 on 2023/01/04.
//

import Foundation

class MemoryStore: ObservableObject {
    @Published var memoryList: [Memory] = []
}
