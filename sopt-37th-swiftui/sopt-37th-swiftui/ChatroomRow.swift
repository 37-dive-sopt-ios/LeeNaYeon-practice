//
//  ChatRow.swift
//  sopt-37th-swiftui
//
//  Created by 이나연 on 11/22/25.
//

import SwiftUI

struct ChatroomRowView: View {
    let chatRoom: ChatRoomModel
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            ZStack {
                Circle()
                Image(.profile)
            }
            .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                HStack() {
                    Text(chatRoom.name)
                        .font(.headline)
                    Text(chatRoom.location)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                Text(chatRoom.lastMessage)
                    .font(.subheadline)
            }
            
            Spacer()
            
            if let thumbnailImage = chatRoom.thumbnail {
                thumbnailImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 16)
    }
}
