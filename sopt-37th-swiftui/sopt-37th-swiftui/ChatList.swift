//
//  ChatList.swift
//  sopt-37th-swiftui
//
//  Created by 이나연 on 11/22/25.
//

import SwiftUI

struct ChatList: View {
    let chatRooms: [ChatRoomModel]
    var body: some View {
        List(chatRooms) { chatRoom in
            ChatroomRowView(chatRoom: chatRoom)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.visible)
                .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                    return -viewDimensions.width
                }
        }
        .listStyle(.plain)
    }
}
