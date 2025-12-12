//
//  GridView.swift
//  sopt-37th-swiftui
//
//  Created by 이나연 on 11/29/25.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        Grid(alignment: .leading, horizontalSpacing: 0, verticalSpacing: 0) {
            GridRow {
                Text("Row 1")
                ForEach(0..<2) { _ in
                    RoundedRectangle(cornerRadius: 4).fill(.red)
                    .frame(width: 40, height: 40)
                }
            }
            
            GridRow {
                Text("Row 2")
                ForEach(0..<5) { _ in
                    RoundedRectangle(cornerRadius: 4).fill(.green)
                    .frame(width: 40, height: 40)
                }
            }
            
            GridRow {
                Text("Row 3")
                ForEach(0..<4) { _ in
                    RoundedRectangle(cornerRadius: 4).fill(.blue)
                    .frame(width: 40, height: 40)
                }
            }
        }
    }
}


#Preview {
    GridView()
}
