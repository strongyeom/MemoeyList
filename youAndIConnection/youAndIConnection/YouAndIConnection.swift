//
//  YouAndIMemory.swift
//  youAndIMemory
//
//  Created by 염성필 on 2023/01/02.
//

import SwiftUI

struct YouAndIConnection: View {
    var body: some View {
        NavigationStack {
            TabView {
                MemoryList()
                    .tabItem {
                        Image(systemName: "doc.plaintext")
                        Text("리스트")
                    }
                MemoryCalendar()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("달력")
                    }
            }
            .navigationBarTitle("추억 가득")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Image(systemName: "calendar")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }

                }
            }
        }
    }
}

struct YouAndIConnection_Previews: PreviewProvider {
    static var previews: some View {
        YouAndIConnection()
    }
}
