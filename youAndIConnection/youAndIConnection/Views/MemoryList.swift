//
//  MemoryList.swift
//  youAndIMemory
//
//  Created by 염성필 on 2023/01/02.
//

import SwiftUI

struct MemoryList: View {
    @State private var isShowingSheet: Bool = false
    @StateObject var memoryStore = MemoryStore()
    var body: some View {
        // 메모를 추가하면 배열 안에 쌓여서 리스트로 나타남
        ZStack {
            List {
                ForEach(memoryStore.memoryList, id:\.self) { memory in
                    Text(memory.description)
                }
            }
            
            
            Button {
                print("생성 버튼이 눌렸습니다.")
                isShowingSheet.toggle()
            } label: {
                Circle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color(red: 247/255, green: 230/255, blue: 12/255))
                    .overlay {
                        Image(systemName: "plus")
                            .font(.system(size: 20))
                    }
            }
            .offset(x: 130,y: 210)
            .sheet(isPresented: $isShowingSheet) {
                AddMemoryMemo(memoryStore: memoryStore, isShowingSheet: $isShowingSheet)
            }

            
        }
        
    }
}

struct MemoryList_Previews: PreviewProvider {
    static var previews: some View {
        MemoryList()
    }
}
