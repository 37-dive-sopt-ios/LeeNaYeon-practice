//
//  sopt_37th_swiftuiApp.swift
//  sopt-37th-swiftui
//
//  Created by 이나연 on 11/22/25.
//

import SwiftUI

@main
struct sopt_37th_swiftuiApp: App {
    var body: some Scene {
        WindowGroup {
            ChatList(chatRooms: ChatRoomModel.mockData)
        }
    }
}
