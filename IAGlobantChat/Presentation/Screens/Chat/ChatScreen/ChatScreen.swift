//
//  Messages.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 25/3/26.
//

import SwiftUI

struct ChatScreen: View {
    @State private var chatName: String = ""
    @Environment(ChatService.self) var chatService
    @State private var show = false
    @State var name =  ""

    var body: some View {

        List {

            ForEach(chatService.chats) { chat in
                NavigationLink(destination: DetalleView(chatId: chat.id)) {
                    ChatView(
                        name: chat.name,
                        message: "No hay mensajes",
                        time: "Ahora"
                    )
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

//#Preview {
//  ChatScreen()
//}
