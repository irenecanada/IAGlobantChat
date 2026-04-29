//
//  Chat.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 24/3/26.
//

import SwiftUI

struct  ChatScreen: View {
    @Environment(ChatService.self) var chatService

    var body: some View {
        Group {
            if chatService.hasChats() {
                ChatListView()
            } else {
                ChatEmptyView()
            }
        }
    }

}



