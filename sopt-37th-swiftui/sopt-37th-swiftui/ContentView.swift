//
//  ContentView.swift
//  sopt-37th-swiftui
//
//  Created by 이나연 on 11/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            ZStack {
                Circle()
                Image(.profile)
            }
            .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                HStack() {
                    Text("이명진")
                        .font(.headline)
                    Text("문정동")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                Text("확인했습니다. 감사합니다 ")
                    .font(.subheadline)
            }
            Spacer()
            Image(.thumbnail)
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    ContentView()
}
