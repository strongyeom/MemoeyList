//
//  TextLimitManager.swift
//  youAndIMemory
//
//  Created by 염성필 on 2023/01/02.
//

import Foundation



/// 텍스트 숫자 제한 
class TextLimitManager: ObservableObject {
    @Published var text = "" {
        didSet {
            if text.count > characterLimit && oldValue.count <= characterLimit {
                text = oldValue
            }
        }
    }
    
    let characterLimit: Int

    init(limit: Int = 10){
        characterLimit = limit
    }
}
