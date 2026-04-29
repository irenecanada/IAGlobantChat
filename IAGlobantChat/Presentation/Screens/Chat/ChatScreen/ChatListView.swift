//
//  Messages.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 25/3/26.
//

import SwiftUI

struct ChatListView: View {
    @State private var chatName: String = ""
    @Environment(ChatService.self) var chatService
    @State private var show = false
    @State var name =  ""

    var body: some View {

        List {

            ForEach(chatService.chats) { chat in
                NavigationLink(destination: ChatDetailScreen(chatId: chat.id)) {
                    ChatListItemView(chat: chat)
                }

            }
        }
        .listStyle(.plain)
        .navigationTitle("Messages")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    show = true
                }) {
                    Image(systemName: "plus")
                }

            }
        }
        .alert("New Chats", isPresented: $show) {
            TextField("Enter chat name...", text: $name)
            Button("Create") {
                chatService.addChats(chatName: name)
            }
            Button("Cancel", role: .cancel){
                chatService.deleteChats()
            }

        } message: {
            Text("Chat Name")
        }
    }
}

