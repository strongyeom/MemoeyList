//
//  Memory.swift
//  youAndIConnection
//
//  Created by 염성필 on 2023/01/04.
//

import Foundation
import UIKit

struct Memory: Identifiable {
    var id: Int // List로 출력할때 Identifiable 처리를 가능하게 함
    var title: String
    var description: String
    var image: UIImage
    var imageUrl: String // asyn이미지 쓸때 필요
    
}
