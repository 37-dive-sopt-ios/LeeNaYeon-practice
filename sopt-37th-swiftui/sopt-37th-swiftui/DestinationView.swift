//
//  DestinationView.swift
//  sopt-37th-swiftui
//
//  Created by 이나연 on 11/29/25.
//

import SwiftUI

struct DestinationView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Teal") {
                ColorDetail(color: .teal)
            }
                    
            NavigationLink {
                ColorDetail(color: .blue)
            } label: {
                Label("Work Folder", systemImage: "folder")
            }
            .navigationTitle("Colors")
        }
    }
}

struct ColorDetail: View {
    var color: Color

    var body: some View {
        color.navigationTitle(color.description)
    }
}


#Preview {
    DestinationView()
}
