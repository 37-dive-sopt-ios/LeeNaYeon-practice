//
//  NavigationPractice.swift
//  sopt-37th-swiftui
//
//  Created by 이나연 on 11/29/25.
//

import SwiftUI

struct NavigationPractice: View {
    var body: some View {
            NavigationStack {
                NavigationLink("첫번째 버튼", value: "하이")
                
                NavigationLink {
                    ColorDetail(color: .teal)
                } label: {
                    Label("Work Folder", systemImage: "folder")
                }
                
                .navigationTitle("Colors")
                .navigationDestination(for: String.self) { value in
                    TextView(text: value)
                }
            }
        }
}

struct TextView: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
}

#Preview {
    NavigationPractice()
}
