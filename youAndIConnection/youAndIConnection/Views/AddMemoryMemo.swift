//
//  AddMemoryMemo.swift
//  youAndIMemory
//
//  Created by 염성필 on 2023/01/02.
//

import SwiftUI
import PhotosUI

struct AddMemoryMemo: View {
    @ObservedObject var textLimitManager = TextLimitManager(limit: 300)
    @StateObject var memoryStore = MemoryStore()
    @Binding var isShowingSheet: Bool
    @State private var memo: String = ""
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var data: Data?
    @State private var saveButtonText: String = "저장"
    @State private var isPhotoLabel: Bool = false
    @State private var textFieldIsDisabled: Bool = false
    var body: some View {
        VStack {
            
            topArea
            middleArea
            
            VStack {
                Button {
                    isShowingSheet.toggle()
                    print("완료 버튼이 눌렸습니다.")
                    let memory: Memory = Memory(id: UUID().uuidString, description: memo)
                    memoryStore.addMemory(memory: memory)
                } label: {
                    Text("완료")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 40)
                        .background(.blue)
                        .cornerRadius(10)
                }

            }
            .frame(maxWidth: .infinity)
            
        }
        .padding()
        .onChange(of: selectedItems) { newValue in
            guard let item = selectedItems.first else {
                return
            }
            item.loadTransferable(type: Data.self) { result in
                switch result {
                case .success(let data):
                    if let data = data {
                        self.data = data
                    } else {
                        print("데이터가 없습니다.")
                    }
                case .failure(let failure):
                    print("\(failure)")
                }
            }
        }
    }
    
    // MARK: - 상단 피커 및 버튼
    fileprivate var topArea: some View {
        HStack {
            Text("날짜 적히는 칸")
            Spacer()
            
            Button {
                print("배경 색상 설정 버튼이 눌렸습니다.")
            } label: {
                Text("색지 설정")
            }
            if saveButtonText == "저장" {
                Button {
                    print("저장 버튼이 눌렸습니다.")
                    saveButtonText = "수정"
                    isPhotoLabel.toggle()
                    textFieldIsDisabled.toggle()
                } label: {
                   
                        Text(saveButtonText)
                }
            } else {
                Button {
                    print("저장 버튼이 눌렸습니다.")
                    saveButtonText = "저장"
                    isPhotoLabel.toggle()
                    textFieldIsDisabled.toggle()
                } label: {
                   
                        Text("수정")
                }
            }
        }
    }
    
    // MARK: - 본문 및 사진 TextField
    fileprivate var middleArea: some View {
        
        VStack(alignment: .trailing) {
            TextField("추억을 입력해주세요", text: $memo, axis: .vertical)
                .lineLimit(4...8)
                .textFieldStyle(.roundedBorder)
                .disabled(textFieldIsDisabled)
            
//            Text("\($memo.text.count) / 300")
                .padding(.bottom, 30)
            //photo
            PhotosPicker(selection: $selectedItems, maxSelectionCount: 1, matching: .images) {
                Image(systemName: "photo.artframe")
                    .font(.largeTitle)
            }
            
            
            if let data = data, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
            }
        }
        
    }
}

struct AddMemoryMemo_Previews: PreviewProvider {
    static var previews: some View {
        AddMemoryMemo(isShowingSheet: .constant(true))
    }
}
