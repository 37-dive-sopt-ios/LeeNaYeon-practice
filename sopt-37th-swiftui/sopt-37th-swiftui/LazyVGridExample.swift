//
//  LazyVGridExample.swift
//  sopt-37th-swiftui
//
//  Created by 이나연 on 11/29/25.
//

import SwiftUI

struct LazyVGridExample: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0x1f600...0x1f679, id: \.self) { value in
                    Text(String(format: "%x", value))
                    Text(emoji(value))
                        .font(.largeTitle)
                }
            }
        }
    }
    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
    
}


#Preview {
    LazyVGridExample()
}
